import 'dart:async';

import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app_bootstrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppBootstrapper.init(
    mainAppWidget: const DevHubHrmsApp(),
    runApp: runApp,
  );
}

/*
cached_network_image dartz dio dio_cache_interceptor dio_cache_interceptor_hive_store dropdown_textfield equatable firebase_core firebase_messaging flutter_bloc flutter_local_notifications flutter_screenutil flutter_svg freezed_annotation geolocator geocoding get_it intl image_picker json_annotation logger lottie shared_preferences permission_handler path_provider shimmer syncfusion_flutter_charts share_plus rxdart url_launcher 
*/
