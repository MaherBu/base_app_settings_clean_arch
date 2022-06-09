import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:service_provider/base/domain/repositories/prefs_repository.dart';
import 'package:service_provider/base/utils/constants.dart';
import 'package:service_provider/base/utils/fimber/fimber.dart';
import 'package:service_provider/base/utils/fimber/logger_impl.dart';
import 'package:service_provider/base/utils/token_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection_container.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$inject',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> inject({String? environment}) async => $inject(getIt, environment: environment);

@module
abstract class AppModule {
  @Named('ApiBaseUrl')
  String get baseUrl => BASE_URL;

  BaseOptions dioOption(@Named('ApiBaseUrl') String baseUrl) => BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 15000,
        receiveTimeout: 15000,
        contentType: 'application/json;charset=utf-8',
        responseType: ResponseType.plain,
        headers: <String, String>{
          'Accept': 'application/json',
          'Connection': 'keep-alive',
        },
      );

  @preResolve
  @singleton
  Future<SharedPreferences> getPrefs() => SharedPreferences.getInstance();

  // @singleton
  // DeepLinkManager getDeepLinkManager(PrefsRepository prefsRepository, Logger logger) => DeepLinkManager(
  //       prefsRepository,
  //       logger,
  //     );

  @singleton
  Dio dio(
    BaseOptions option,
    Logger logger,
    PrefsRepository prefsRepository,
  ) {
    final Dio dio = Dio(option);
    return dio
      ..interceptors.addAll(<Interceptor>[
        TokenInterceptor(
          baseDio: dio,
          prefsRepository: prefsRepository,
          logger: logger,
        ),
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      ]);
  }

  @Singleton(as: Logger)
  LoggerImpl logger() => LoggerImpl();

  // @lazySingleton
  // UserModel loggedInUser(PrefsRepository prefsRepository) => prefsRepository.user!;
}
