import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../core.dart';
import 'api_interface.dart';
import 'dio_service.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;

  ApiService(DioService dioService) : _dioService = dioService;

  Future<Map<String, dynamic>?> getAuthorizationHeader() async {
    var headers = <String, dynamic>{};
    // var accessToken = await KeyValueStorageService().getAuthToken();
    var accessToken = SharedPrefs().getToken();
    if (accessToken.isNotEmpty) {
      headers['token'] = accessToken;
    }
    return headers;
  }

  @override
  Future<T> request<T>({
    required String endpoint,
    required DioMethod method,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    formData,
    required T Function(Response response) converter,
  }) async {
    Response response;
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = await getAuthorizationHeader();

    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    try {
      response = await _dioService.request(
        endpoint: endpoint,
        method: method,
        data: data,
        options: requestOptions,
        cancelToken: cancelToken,
        formData: formData,
      );

      return converter(response);
    } on DioException catch (e) {
      Log.d(e);
      // throw CustomException.fromDioException(e);
      final ex = CustomException.fromDioException(e);
      return converter(Response(
        requestOptions: RequestOptions(),
        statusCode: ex.code,
        statusMessage: ex.message,
      ));
    }
  }
}
