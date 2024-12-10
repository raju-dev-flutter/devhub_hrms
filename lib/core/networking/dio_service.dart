import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

// Exceptions
import '../core.dart';

import 'api_interface.dart';
import 'custom_exception.dart';

class DioService {
  final Dio _dio;

  final CacheOptions? globalCacheOptions;

  final CancelToken _cancelToken;

  //
  DioService({
    required Dio dioClient,
    this.globalCacheOptions,
    Iterable<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
  })  : _dio = dioClient,
        _cancelToken = CancelToken() {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
    if (httpClientAdapter != null) _dio.httpClientAdapter = httpClientAdapter;
  }

  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Cancelled');
    } else {
      cancelToken.cancel();
    }
  }

  Future<Response> request<R>({
    required String endpoint,
    required DioMethod method,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    formData,
  }) async {
    Response response;
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    try {
      switch (method) {
        case DioMethod.POST:
          response = await _dio.post(endpoint,
              data: json.encode(data), options: requestOptions);
          break;
        case DioMethod.GET:
          response = await _dio.get(endpoint,
              queryParameters: data, options: requestOptions);
          break;
        case DioMethod.PUT:
          response = await _dio.put(endpoint,
              data: data == null ? formData : json.encode(data),
              options: requestOptions);
          break;
        case DioMethod.DELETE:
          response = await _dio.delete(endpoint,
              data: data ?? formData, options: requestOptions);
          break;
      }

      return response;
    } on DioException catch (e) {
      Log.w(e);
      // throw CustomException.fromDioException(e);
      final ex = CustomException.fromDioException(e);
      return Response(
        requestOptions: RequestOptions(headers: options?.headers),
        statusCode: ex.code,
        statusMessage: ex.message,
      );
    }
  }
}
