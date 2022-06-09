import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

typedef BaseMapper<T> = BaseResponseModel<T> Function(Map<String, dynamic>);

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> extends Equatable {
  const BaseResponseModel({
    this.statusCode,
    this.message,
    this.result,
  });

  @JsonKey(name: 'status')
  final int? statusCode;
  final String? message;
  final T? result;

  BaseResponseModel<T> copyWith({
    int? statusCode,
    String? message,
    T? result,
  }) {
    return BaseResponseModel<T>(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      statusCode,
      message,
      result,
    ];
  }

  static T Function(Map<String, dynamic>) rowDataMapper<T>() =>
          (Map<String, dynamic> json) => json['localResult'] as T;

  static BaseMapper<R> fromJson<R>(
      R Function(Map<String, dynamic>) fromJsonT) =>
          (Object? baseJson) => _$BaseResponseModelFromJson(
        baseJson as Map<String, dynamic>,
            (Object? json) {
          try {
            return fromJsonT(json as Map<String, dynamic>);
          } catch (ex) {
            return fromJsonT({'localResult': json});
          }
        },
      );

  // static PaginationMapper<R> fromJsonWithPagination<R>(
  //   R Function(Object) fromJsonT,
  // ) =>
  //     (Object? baseJson) => _$BaseResponseModelFromJson<PaginationResponse<R>>(
  //           baseJson as Map<String, dynamic>,
  //           (Object? paginationJson) => PaginationResponse.fromJson<R>(
  //             paginationJson as Map<String, dynamic>,
  //             fromJsonT as R Function(Object?),
  //           ),
  //         );

  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) =>
      _$BaseResponseModelToJson(this, toJsonT);
}
