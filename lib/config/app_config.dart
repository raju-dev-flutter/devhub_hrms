import 'package:flutter/foundation.dart';

@immutable
class Config {
  const Config._();

  /// PROJECT BASE API [ENDPOINT].
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://almodesk.com/api/v1',
  );

  /// GOOGLE MAP BASE API [ENDPOINT].
  static const googleMapUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://maps.googleapis.com/maps',
  );
}
