import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

// Exceptions
import '../core.dart';

class GoogleDioService {
  final Dio _dio;

  final CacheOptions? globalCacheOptions;

  final CancelToken _cancelToken;

  GoogleDioService({
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
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    try {
      switch (method) {
        case DioMethod.POST:
          return await _dio.post(endpoint,
              data: json.encode(data), options: requestOptions);
        case DioMethod.GET:
          return await _dio.get(endpoint,
              queryParameters: data, options: requestOptions);
        case DioMethod.PUT:
          return await _dio.put(endpoint,
              data: data == null ? formData : json.encode(data),
              options: requestOptions);
        case DioMethod.DELETE:
          return await _dio.delete(endpoint,
              data: data ?? formData, options: requestOptions);
        default:
          return await _dio.post(endpoint,
              data: data ?? formData, options: requestOptions);
      }
    } on DioException catch (e) {
      final ex = CustomException.fromDioException(e);
      return Response(
          requestOptions: RequestOptions(),
          statusCode: ex.code,
          statusMessage: ex.message,
          data: {"message": ex.message});
      // throw CustomException.fromDioException(e);
    }
  }
}
