import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:service_provider/base/data/datasource/base_remote_datasource.dart';
import 'package:service_provider/base/data/datasource/base_remote_datasource_impl.dart';
import 'package:service_provider/base/data/models/base_response_model.dart';
import 'package:service_provider/base/data/models/tokens_model.dart';
import 'package:service_provider/base/utils/fimber/fimber.dart';
import 'package:service_provider/base/utils/network_result.dart';

abstract class AppDataSource extends BaseRemoteDataSourceImpl {
  AppDataSource({
    required Dio client,
    required Logger logger,
  }) : super(client: client, logger: logger);

  Future<NetworkResult<String>> getTwoFactorStatus();
  Future<NetworkResult<TokensModel>> editTwoFactor(bool enable);
}

@LazySingleton(as: AppDataSource)
class AppDataSourceImpl extends AppDataSource {
  AppDataSourceImpl({
    required Dio client,
    required Logger logger,
  }) : super(client: client, logger: logger);

  @override
  Future<NetworkResult<String>> getTwoFactorStatus() => request(
        method: METHOD.GET,
        /// Here Should be the Token Model
        endpoint: "EndPoints.twoFactorStatus",
        mapper: BaseResponseModel.rowDataMapper(),
      );

  @override
  Future<NetworkResult<TokensModel>> editTwoFactor(bool enable) => request(
        method: METHOD.POST,
        /// Here Should be the Token Model
        endpoint: "EndPoints.twoFactorEdit",
        mapper: TokensModel.fromJson,
        data: {'value': enable},
      );
}
