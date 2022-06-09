import 'package:dio/dio.dart';

// ignore: constant_identifier_names
enum METHOD { GET, POST, PUT, DELETE }

typedef Mapper<T> = T Function(Object?);

abstract class BaseRemoteDataSource {
  Future<Response> performGetRequest({
    required String endpoint,
    Map<String, dynamic>? params,
    Options? options,
  });

  Future<Response> performPostRequest({
    required String endpoint,
    required data,
    Map<String, dynamic>? params,
    Options? options,
  });

  Future<Response> performPutRequest({
    required String endpoint,
    required data,
    Map<String, dynamic>? params,
    Options? options,
  });

  Future<Response> performDeleteRequest({
    required String endpoint,
    Map<String, dynamic>? params,
    Options? options,
  });

  Map<String, dynamic> wrapWithBaseData(dynamic data);
}
