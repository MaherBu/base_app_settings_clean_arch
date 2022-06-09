import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:service_provider/base/data/models/base_response_model.dart';
import 'package:service_provider/base/data/models/tokens_model.dart';
import 'package:service_provider/base/domain/repositories/prefs_repository.dart';
import 'package:service_provider/base/utils/constants.dart';
import 'package:service_provider/base/utils/dio/token_option.dart';
import 'package:service_provider/base/utils/end_points.dart';
import 'package:service_provider/base/utils/extensions/map.dart';
import 'package:service_provider/base/utils/fimber/fimber.dart';


class TokenInterceptor extends Interceptor {
  TokenInterceptor({
    required this.baseDio,
    required this.prefsRepository,
    required this.logger,
    // required this.loginInteractor,
  });

  final PrefsRepository prefsRepository;
  final Dio baseDio;
  final Logger logger;
  // final LoginInteractor loginInteractor;

  // We use a new Dio(to avoid dead lock) instance to request token.
  final Dio tokenDio = Dio()
    ..interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        requestHeader: true,
        request: true,
      ),
    ]);

  @override
  void onRequest(options, handler) {
    if (TokenOption.needToken(options)) {
      options.queryParameters['auth_token'] = 'Bearer ' + (prefsRepository.accessToken ?? '');
    }

    if (options.method == 'POST' && options.data is Map<String, dynamic>) {
      options.data = (options.data as Map<String, dynamic>).asFormData;
    }

    handler.next(options);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    try {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.data);
      final int statusCode = jsonResponse['status'];

      switch (statusCode) {
        case kOkCode:
          handler.next(response..data = jsonResponse);
          return;
        case kUnauthorizedCode:
          await refreshToken(response, handler);
          return;
        case kTwoFactorCode:
          await twoFactorRedirect(response, handler);
          return;
        case kNeedOtpCode:
          // await twoFactorRedirect(response, handler);
          handler.reject(
            DioError(
              type: DioErrorType.response,
              requestOptions: response.requestOptions,
              response: response,
              error: kNeedOtpCode,
            ),
            true,
          );
          return;
        default:
          handler.reject(
            DioError(
              requestOptions: response.requestOptions,
              response: response,
              error: jsonResponse['message'],
            ),
            true,
          );
          return;
      }
    } catch (ex, st) {
      logger.e('Dio OnResponse Unknown Error ex:$ex\nst: $st\n$response');
      handler.reject(
        DioError(requestOptions: response.requestOptions, response: response, error: ex),
        true,
      );
    }
  }

  Future<void> refreshToken(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (prefsRepository.accessToken == null || prefsRepository.refreshToken == null) {
      throw Exception('Refresh token fail with null token in prefs');
    }
    try {
      tokenDio.options = baseDio.options;
      final tokenRes = await tokenDio.post(
        BASE_URL,
        data: {
          'method': EndPoints.refreshToken,
          'refresh_token': prefsRepository.refreshToken,
        }.asFormData,
      );

      if (tokenRes.statusCode != 200) {
        throw Exception('unknown error with Refresh token');
        // throw Exception('Refresh token fail with 401');
      }

      final res = BaseResponseModel.fromJson(TokensModel.fromJson)(jsonDecode(tokenRes.data));

      // this status mean that refresh token is invalidate and we should go
      // to login page after unlock dio for login requests
      if (res.statusCode != kOkCode) {
        throw Exception('Refresh token fail with status code error ${res.statusCode}');
      }

      final tokens = res.result!;
      await prefsRepository.setAccessToken(tokens.accessToken!);
      await prefsRepository.setRefreshToken(tokens.refreshToken!);

      final requestOptions = response.requestOptions;
      final Options newOptions = Options(
        contentType: requestOptions.contentType,
        extra: requestOptions.extra,
        followRedirects: requestOptions.followRedirects,
        headers: requestOptions.headers,
        listFormat: requestOptions.listFormat,
        maxRedirects: requestOptions.maxRedirects,
        method: requestOptions.method,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        receiveTimeout: requestOptions.receiveTimeout,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        responseType: requestOptions.responseType,
        sendTimeout: requestOptions.sendTimeout,
        validateStatus: requestOptions.validateStatus,
      );

      dynamic _data;
      if (requestOptions.data != null && requestOptions.data is FormData) {
        final FormData newFormData = FormData();
        newFormData.fields.addAll(requestOptions.data.fields);

        for (final MapEntry mapFile in requestOptions.data.files) {
          // newFormData.files.add(
          //   MapEntry(
          //     mapFile.key,
          //     MultipartFileExtended.fromFileSync(mapFile.value.filePath, filename: mapFile.value.filename),
          //   ),
          // );
        }

        _data = newFormData;
      }

      final newResponse = await tokenDio.request(
        requestOptions.path,
        data: _data,
        queryParameters: TokenOption.needToken(requestOptions)
            ? (requestOptions.queryParameters..['auth_token'] = 'Bearer ' + prefsRepository.accessToken!)
            : requestOptions.queryParameters,
        cancelToken: requestOptions.cancelToken,
        options: newOptions,
        onSendProgress: requestOptions.onSendProgress,
        onReceiveProgress: requestOptions.onReceiveProgress,
      );

      final Map<String, dynamic> jsonResponse = jsonDecode(newResponse.data);
      final int statusCode = jsonResponse['status'];

      if (statusCode == kOkCode) {
        return handler.next(newResponse..data = jsonResponse);
      } else {
        handler.reject(
          DioError(
            requestOptions: response.requestOptions,
            response: response,
            error: jsonResponse['message'],
          ),
          true,
        );
      }
    } catch (ex, st) {
      logger.e('refresh token unknown error ex: $ex\nst: $st');
      // await prefsRepository.clearUserData();
      // App.navKey.currentState!.pushNamedAndRemoveUntil(LoginPage.route, (_) => false);
    }
  }

  Future<void> twoFactorRedirect(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    logger.d('twoFactorRedirect with request data ${response.requestOptions.data}');
    // await OtpPage.show(
    //   context: App.navKey.currentContext!,
    //   type: OtpType.TWO_FACTOR,
    //   onSuccess: () {},
    //   params: {
    //     'username': (response.requestOptions.data as FormData).fields[0].value,
    //     'password': (response.requestOptions.data as FormData).fields[1].value,
    //   },
    //   requestOtp: false,
    // );
    throw Exception('');
    // App.navKey.currentContext!.pushNamed(
    //   OtpPage.route,
    //   arguments: OtpPage.createRouteSettings(
    //     type: OtpType.TWO_FACTOR,
    //     onSuccess: () {},
    //     params: {
    //       'username': (response.requestOptions.data as FormData).fields[0].value,
    //       'password': (response.requestOptions.data as FormData).fields[1].value,
    //     },
    //     requestOtp: false,
    //   ),
    // );
  }
}
