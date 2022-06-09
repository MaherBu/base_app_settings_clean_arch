import 'package:service_provider/app/data/datasource/app_datasource.dart';
import 'package:service_provider/base/domain/repositories/service_prvider_repository.dart';
import 'package:service_provider/base/utils/network_result.dart';

abstract class AppRepository extends ServiceProviderRepository<AppDataSource> {
  const AppRepository(AppDataSource appDataSource) : super(appDataSource);

  Future<NetworkResult<bool>> getTwoFactorStatus();
  Future<NetworkResult<bool>> editTwoFactor(bool enable);
}
