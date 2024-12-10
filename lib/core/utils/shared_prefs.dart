import 'package:shared_preferences/shared_preferences.dart';

import '../core.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _prefs;

  // void setLoginResponse(AuthResponseModel res) {
  //   instance.setInt(AppKeys.userId, res.authUser?.id ?? 0);
  //   instance.setString(AppKeys.userName, res.authUser?.name ?? "");
  //   instance.setString(AppKeys.menu, res.authUser?.mobileNumber ?? "");
  //   instance.setString(AppKeys.email, res.authUser?.email ?? "");
  //   instance.setString(AppKeys.role, res.authUser?.role ?? "");
  //   instance.setString(
  //       AppKeys.organizationType, res.authUser?.organizationType ?? "");
  // }

  void setGeoAddress(double lat, double long, String address) {
    instance.setDouble(AppKeys.currentLatitude, lat);
    instance.setDouble(AppKeys.currentLongitude, long);
    instance.setString(AppKeys.currentAddress, address);
  }

  void setNotifications(bool notify) {
    instance.setBool(AppKeys.notification, notify);
  }

  bool getNotifications() => instance.getBool(AppKeys.notification) ?? false;

  void setMenu(String menu) => instance.setString(AppKeys.menu, menu);

  String getMenu() => instance.getString(AppKeys.menu) ?? '';

  String getToken() => instance.getString(AppKeys.loginToken) ?? '';
  int getUserId() => instance.getInt(AppKeys.userId) ?? 0;

  String getRole() => instance.getString(AppKeys.role) ?? '';
  String getOrganizationType() =>
      instance.getString(AppKeys.organizationType) ?? '';

  String getUserType() => instance.getString(AppKeys.userType) ?? '';
}
