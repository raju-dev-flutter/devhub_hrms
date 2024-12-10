import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../core.dart';

// Utils
// import '../../utils/typedefs.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final httpMethod = options.method.toUpperCase();
    final url = options.baseUrl + options.path;

    Logger().w('--> $httpMethod $url'); //GET www.example.com/mock_path/all

    Logger().w('\tHeaders:');
    options.headers.forEach((k, Object? v) => debugPrint('\t\t$k: $v'));

    if (options.queryParameters.isNotEmpty) {
      Logger().w('\tqueryParams:');
      options.queryParameters
          .forEach((k, Object? v) => debugPrint('\t\t$k: $v'));
    }

    if (options.data != null) {
      Logger().w('\tBody: ${options.data}');
    }

    Logger().w('--> END $httpMethod');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    Logger().i('<-- RESPONSE');

    Logger().i('\tStatus code: ${response.statusCode}');

    if (response.statusCode == 304) {
      Logger().i('\tSource: Cache');
    } else {
      Logger().i('\tSource: Network');
    }

    Logger().i('\tResponse: ${response.data}');

    Logger().i('<-- END HTTP');

    return super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    Logger().e('--> ERROR');
    final httpMethod = err.requestOptions.method.toUpperCase();
    final url = err.requestOptions.baseUrl + err.requestOptions.path;

    Logger().e('\tMETHOD: $httpMethod'); // GET
    Logger().e('\tURL: $url'); // URL
    if (err.response != null) {
      Logger().e('\tStatus code: ${err.response!.statusCode}');
      if (err.response!.data != null) {
        final headers = err.response!.data['headers'] as JSON; //API Dependant
        final message = headers['message'] as String; //API Dependant
        final code = headers['code'] as String; //API Dependant
        Logger().e('\tException: $code');
        Logger().e('\tMessage: $message');
        if (headers.containsKey('data')) {
          //API Dependant
          final data = headers['data'] as List<Object?>;
          if (data.isNotEmpty) {
            Logger().e('\tData: $data');
          }
        }
      } else {
        Logger().e('${err.response!.data}');
      }
    } else if (err.error is SocketException) {
      const message = 'No internet connectivity';
      Logger().e('\tException: FetchDataException');
      Logger().e('\tMessage: $message');
    } else {
      Logger().e('\tUnknown Error');
    }

    Logger().e('<-- END ERROR');

    return super.onError(err, handler);
  }
}
