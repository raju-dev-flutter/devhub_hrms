import 'dart:async';

import 'package:geolocator/geolocator.dart';

import '../core.dart';

class GpsService {
  late StreamSubscription<Position> _positionStream;

  Bool isAccessGranted(LocationPermission permission) {
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  FutureBool requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (isAccessGranted(permission)) {
      return true;
    }
    permission = await Geolocator.requestPermission();
    return isAccessGranted(permission);
  }

  FutureVoid startPositionStreaming(PositionCallBack callback) async {
    bool permissionGranted = await requestPermission();
    if (!permissionGranted) {
      throw Exception("User did not grant GPS permission.");
    }
    _positionStream = Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
                accuracy: LocationAccuracy.bestForNavigation))
        .listen(callback);
  }

  FutureVoid stopPositionStreaming() async {
    await _positionStream.cancel();
  }
}
