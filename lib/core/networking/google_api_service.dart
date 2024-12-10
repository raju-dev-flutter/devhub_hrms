import 'package:dio/dio.dart';

import '../core.dart';

class GoogleApiService implements ApiInterface {
  late final GoogleDioService _dioService;

  GoogleApiService(GoogleDioService dioService) : _dioService = dioService;

  Future<Map<String, dynamic>?> getAuthorizationHeader() async {
    var headers = <String, dynamic>{};
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
      final ex = CustomException.fromDioException(e);
      return converter(Response(
          requestOptions: RequestOptions(),
          statusCode: ex.code,
          statusMessage: ex.message,
          data: {"message": ex.message}));
    }
  }
}
