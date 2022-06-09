import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:service_provider/base/data/datasource/base_remote_datasource.dart';
import 'package:service_provider/base/data/models/base_response_model.dart';
import 'package:service_provider/base/utils/constants.dart';
import 'package:service_provider/base/utils/dio/token_option.dart';
import 'package:service_provider/base/utils/error/failure.dart';
import 'package:service_provider/base/utils/fimber/fimber.dart';
import 'package:service_provider/base/utils/network_result.dart';

class BaseRemoteDataSourceImpl {
  BaseRemoteDataSourceImpl({
    required Logger logger,
    required Dio client,
  })  : _logger = logger,
        _client = client;

  final Logger _logger;
  final Dio _client;

  Future<NetworkResult<T>> baseRequest<T>({
    required METHOD method,
    required String endpoint,
    required T Function(Map<String, dynamic>) mapper,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    String? messageErrorKey = 'msg_something_wrong',
    bool withAuth = true,
    bool wrapData = true,
  }) async {
    try {
      _logger.d('Endpoint: $endpoint');
      late Response response;
      final Options options = withAuth ? TokenOption.toOptions().copyWith(headers: headers) : Options(headers: headers);
      switch (method) {
        case METHOD.GET:
          response = await _client.get('', queryParameters: (params ?? {})..['method'] = endpoint, options: options);
          break;
        case METHOD.POST:
          _logger.d('POST body: ${(wrapData ? wrapWithBaseData(data) : data)?..['method']}');
          response = await _client.post(
            '',
            data: (wrapData ? wrapWithBaseData(data) : data)?..['method'] = endpoint,
            queryParameters: (params ?? {})..['method'] = endpoint,
            options: options,
          );
          break;
        default:
          throw UnimplementedError('$method not implemented');
      }

      if ((response.data['status'] as int?) != kOkCode) {
        return NetworkError(ServerFailure(response.data['message']));
      }

      return Success(mapper(response.data));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response && e.error == kNeedOtpCode) {
        final Map<String, dynamic> jsonResponse = jsonDecode(e.response!.data!);
        return NetworkError(LoginFailure('', jsonResponse['result']));
      }
      _logger.d('Service Provider Data Source Error $e');
      return NetworkError(ServerFailure(e.error));
    } catch (e, st) {
      _logger.e('Service Provider Unknown Data Source Error with request<$T>,error = $e\nst: $st');
      return NetworkError(ServerFailure(messageErrorKey));
    }
  }

  Future<NetworkResult<T>> request<T>({
    required METHOD method,
    required String endpoint,
    required T Function(Map<String, dynamic>) mapper,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    String? messageErrorKey = 'msg_something_wrong',
    bool withAuth = true,
    bool wrapData = true,
  }) =>
      baseRequest(
        method: method,
        endpoint: endpoint,
        mapper: BaseResponseModel.fromJson(mapper),
        data: data,
        params: params,
        headers: headers,
        messageErrorKey: messageErrorKey,
        withAuth: withAuth,
        wrapData: wrapData,
      ).then((res) {
        if (res.getOrNull() != null) {
          return Success(res.getOrNull()!.result!);
        }
        return NetworkError(res.getFailure());
      });


  Map<String, dynamic> wrapWithBaseData(data) {
    return data;
  }
}

class LoginFailure extends Failure {
  const LoginFailure(String? message, this.guid) : super(message);
  final int guid;
}
