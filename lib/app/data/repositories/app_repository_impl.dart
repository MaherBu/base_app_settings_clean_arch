import 'package:injectable/injectable.dart';
import 'package:service_provider/app/data/datasource/app_datasource.dart';
import 'package:service_provider/app/domain/repositories/app_repository.dart';
import 'package:service_provider/base/domain/repositories/prefs_repository.dart';
import 'package:service_provider/base/utils/extensions/future.dart';
import 'package:service_provider/base/utils/network_result.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  const AppRepositoryImpl(
    AppDataSource appDataSource,
    this._prefsRepository,
  ) : super(appDataSource);

  final PrefsRepository _prefsRepository;

  @override
  Future<NetworkResult<bool>> editTwoFactor(bool enable) => dataSource.editTwoFactor(enable).whenSuccess((it) async {
        await _prefsRepository.setAccessToken(it.accessToken!);
        await _prefsRepository.setRefreshToken(it.refreshToken!);
        return Success(enable);
      });

  @override
  Future<NetworkResult<bool>> getTwoFactorStatus() =>
      dataSource.getTwoFactorStatus().whenSuccessWrapped((it) => int.tryParse(it) == 1);
}
