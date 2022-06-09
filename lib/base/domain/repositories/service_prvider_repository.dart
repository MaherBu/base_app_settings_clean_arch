import 'package:flutter/foundation.dart';
import 'package:service_provider/base/data/datasource/base_remote_datasource_impl.dart';

abstract class ServiceProviderRepository<T extends BaseRemoteDataSourceImpl> {
  const ServiceProviderRepository(this.dataSource);

  @protected
  final T dataSource;
}
