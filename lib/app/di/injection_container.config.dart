// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../base/data/repositories/prefs_repository_impl.dart' as _i8;
import '../../base/domain/repositories/prefs_repository.dart' as _i7;
import '../../base/utils/fimber/fimber.dart' as _i3;
import '../../features/splash/presetation/viewmodels/splash_viewmodel.dart'
    as _i5;
import '../data/datasource/app_datasource.dart' as _i10;
import '../data/repositories/app_repository_impl.dart' as _i12;
import '../domain/interactors/edit_two_factor_interactor.dart' as _i13;
import '../domain/interactors/two_factor_status_interactor.dart' as _i14;
import '../domain/repositories/app_repository.dart' as _i11;
import '../viewmodels/app_viewmodel.dart' as _i9;
import 'injection_container.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $inject(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.Logger>(appModule.logger());
  await gh.singletonAsync<_i4.SharedPreferences>(() => appModule.getPrefs(),
      preResolve: true);
  gh.factory<_i5.SplashViewmodel>(() => _i5.SplashViewmodel(get<_i3.Logger>()));
  gh.factory<String>(() => appModule.baseUrl, instanceName: 'ApiBaseUrl');
  gh.factory<_i6.BaseOptions>(
      () => appModule.dioOption(get<String>(instanceName: 'ApiBaseUrl')));
  gh.lazySingleton<_i7.PrefsRepository>(
      () => _i8.PrefsRepositoryImpl(get<_i4.SharedPreferences>()));
  gh.factory<_i9.AppViewmodel>(
      () => _i9.AppViewmodel(get<_i3.Logger>(), get<_i7.PrefsRepository>()));
  gh.singleton<_i6.Dio>(appModule.dio(
      get<_i6.BaseOptions>(), get<_i3.Logger>(), get<_i7.PrefsRepository>()));
  gh.lazySingleton<_i10.AppDataSource>(() => _i10.AppDataSourceImpl(
      client: get<_i6.Dio>(), logger: get<_i3.Logger>()));
  gh.lazySingleton<_i11.AppRepository>(() => _i12.AppRepositoryImpl(
      get<_i10.AppDataSource>(), get<_i7.PrefsRepository>()));
  gh.factory<_i13.EditTwoFactorInteractor>(
      () => _i13.EditTwoFactorInteractor(get<_i11.AppRepository>()));
  gh.factory<_i14.TwoFactorStatusInteractor>(
      () => _i14.TwoFactorStatusInteractor(get<_i11.AppRepository>()));
  return get;
}

class _$AppModule extends _i15.AppModule {}
