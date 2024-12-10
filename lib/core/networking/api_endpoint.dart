// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../config/config.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static const baseUrl = Config.baseUrl;
  static const googleMapUrl = Config.googleMapUrl;

  /// RETURNS THE PATH FOR AN AUTHENTICATION [ENDPOINT].
  static String auth(AuthEndpoint endpoint) {
    const path = '/public';
    switch (endpoint) {
      case AuthEndpoint.LOGIN:
        return '$path/api-login';
      case AuthEndpoint.LOGIN_WITH_OTP:
        return '$path/api-login-otp';
      case AuthEndpoint.CHANGE_PASSWORD:
        return '$path/api-change-password';
    }
  }

  /// RETURNS THE PATH FOR AN MENU AND DOWNLOAD [ENDPOINT].
  static String download(DownloadEndpoint endpoint) {
    const path = '/public';
    switch (endpoint) {
      case DownloadEndpoint.MENU:
        return '$path/api-menu-permission';
      case DownloadEndpoint.START_GET_DATA:
        return '$path/api-srtarget-data';
      case DownloadEndpoint.ALL_DATA:
        return '$path/api-all-datas';
      case DownloadEndpoint.GRN:
        return '$path/api-grn-list';
    }
  }
}

enum AuthEndpoint { LOGIN, LOGIN_WITH_OTP, CHANGE_PASSWORD }

enum DownloadEndpoint { MENU, START_GET_DATA, ALL_DATA, GRN }
