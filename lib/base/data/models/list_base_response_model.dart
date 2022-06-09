// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'list_base_reponse_model.g.dart';
//
// typedef ListMapper<T> = ListBaseResponseModel<T> Function(Map<String, dynamic>);
//
// @JsonSerializable(genericArgumentFactories: true)
// class ListBaseResponseModel<T> extends Equatable {
//   const ListBaseResponseModel({
//     this.offset,
//     this.size,
//     this.number,
//     this.numberOfElements,
//     this.totalElements,
//     this.totalPage,
//     this.empty,
//     this.first,
//     this.last,
//     this.statusCode,
//     this.message,
//     this.result,
//   });
//
//   @JsonKey(name: 'status')
//   final int? statusCode;
//   final String? message;
//   final List<T>? result;
//   final int? offset;
//   final int? size;
//   final int? number;
//   final int? numberOfElements;
//   final int? totalElements;
//   final int? totalPage;
//   final bool? empty;
//   final bool? first;
//   final bool? last;
//
//   ListBaseResponseModel<T> copyWith({
//     int? statusCode,
//     String? message,
//     List<T>? result,
//   }) {
//     return ListBaseResponseModel<T>(
//       statusCode: statusCode ?? this.statusCode,
//       message: message ?? this.message,
//       result: result ?? this.result,
//     );
//   }
//
//   @override
//   bool get stringify => true;
//
//   @override
//   List<Object?> get props {
//     return [
//       statusCode,
//       message,
//       result,
//       offset,
//       size,
//       number,
//       numberOfElements,
//       totalElements,
//       totalPage,
//       empty,
//       first,
//       last,
//     ];
//   }
//
//   int? get nextPage => last == true ? null
//       : (result?.length ?? 0) == 0
//       ? null
//       : (number ?? 0) + 1;
//
//   static ListMapper<R> fromJson<R>(R Function(Map<String, dynamic>) fromJsonT) =>
//           (Object? baseJson) => _$ListBaseResponseModelFromJson(
//         baseJson as Map<String, dynamic>,
//             (Object? json) => fromJsonT(json as Map<String, dynamic>),
//       );
//
//   Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ListBaseResponseModelToJson(this, toJsonT);
//
// // static ListBaseResponseModel<Null> Function(Map<String, dynamic>) get noDataMapper =>
// //     (Map<String, dynamic> baseJson) => _$ListBaseResponseModelFromJson(baseJson, (_) => null);
// }
