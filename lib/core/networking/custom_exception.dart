import 'package:dio/dio.dart';

enum ExceptionType {
  CancelException,
  ConnectTimeoutException,
  SendTimeoutException,
  ReceiveTimeoutException,
  SocketException,
  FetchDataException,
  FormatException,
  UnrecognizedException,
  ApiException,
  SerializationException,
}

class CustomException implements Exception {
  int code = -1;
  String message = "";

  String get errorMessageWithStatusCode => '$code Error: $message';

  String get errorMessage => message;

  @override
  String toString() {
    if (message == "") return "Exception";

    return "Exception code $code, $message";
  }

  CustomException({required this.message, required this.code});

  factory CustomException.fromDioException(Exception error) {
    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.connectionTimeout:
            return CustomException(code: 577, message: "Connection timed out");
          case DioExceptionType.sendTimeout:
            return CustomException(code: -1, message: "Send timed out");

          case DioExceptionType.receiveTimeout:
            return CustomException(code: -1, message: "Receive timed out");

          case DioExceptionType.badCertificate:
            return CustomException(code: -1, message: "Bad SSL certificates");

          case DioExceptionType.badResponse:
            switch (error.response!.statusCode) {
              case 400:
                return CustomException(code: 400, message: "Bad request");
              case 401:
                return CustomException(code: 401, message: "Permission denied");
              case 500:
                return CustomException(
                    code: 500, message: "Server internal error");
            }
            return CustomException(
                code: error.response!.statusCode!,
                message: "Server bad response");

          case DioExceptionType.cancel:
            return CustomException(code: -1, message: "Server canceled it");

          case DioExceptionType.connectionError:
            return CustomException(code: -1, message: "Connection error");

          case DioExceptionType.unknown:
            return CustomException(code: -1, message: "Unknown error");
        }
      } else {
        return CustomException(code: -1, message: 'Error unrecognized');
      }
    } on FormatException catch (e) {
      return CustomException(code: -1, message: e.message);
    } on Exception catch (_) {
      return CustomException(code: -1, message: 'Error unrecognized');
    }
  }

  factory CustomException.fromParsingException(Exception error) {
    return CustomException(
      code: -1,
      message: 'Failed to parse network response to model or vice versa',
    );
  }

  factory CustomException.fromResponseException(Response<dynamic> response) {
    if (response.data != null) {
      return CustomException(
          message: response.data["message"] ?? "",
          code: response.statusCode ?? -1);
    }
    if (response.data == null) {
      return CustomException(
          message: response.statusMessage ?? "",
          code: response.statusCode ?? -1);
    }
    return CustomException(
      code: -1,
      message: 'Failed to parse network response to model or vice versa',
    );
  }
}
