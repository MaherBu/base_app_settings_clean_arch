import 'package:dio/dio.dart';

extension MapExt on Map<String, dynamic> {
  FormData get asFormData => FormData.fromMap(this);
}
