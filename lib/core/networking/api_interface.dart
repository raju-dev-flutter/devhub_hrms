// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import '../core.dart';

abstract class ApiInterface {
  const ApiInterface();

  Future<T> request<T>({
    required String endpoint,
    required DioMethod method,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    formData,
    required T Function(Response response) converter,
  });
}

enum DioMethod { POST, GET, PUT, DELETE }
