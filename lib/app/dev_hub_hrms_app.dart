import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/config.dart';
import '../core/core.dart';
import '../feature/feature.dart';
import 'app.dart';

class DevHubHrmsApp extends StatefulWidget {
  const DevHubHrmsApp({super.key});

  @override
  State<DevHubHrmsApp> createState() => _DevHubHrmsAppState();
}

class _DevHubHrmsAppState extends State<DevHubHrmsApp> {
  final LocalNotificationServices localNotificationServices =
      LocalNotificationServices();

  @override
  void initState() {
    super.initState();

    localNotificationServices.requestNotificationPermission();
    localNotificationServices.firebaseInit(context);
    localNotificationServices.setupInteractMessage(context);

    localNotificationServices.getDeviceToken().then((token) {
      setState(() => Log.i("Device Token: $token"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (ctx, child) {
        return MaterialApp(
          title: AppKeys.companyName,
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: GeneratorTheme.lightTheme,
          onGenerateRoute: AppRouter.generateRoute,
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (BuildContext context, AuthenticationState state) {
              // if (state is AuthenticationUninitialized) {
              //   return const SplashScreen();
              // }
              // if (state is AppPermissionNotGranted) {
              //   return const PermissionRequestScreen();
              // }
              // if (state is AuthenticationUnauthenticated) {
              //   return const GetStartScreen();
              // }
              // if (state is AuthenticationAuthenticated) {
              return const RootScreen();
              // }
              return const UnknownScreen();
            },
          ),
        );
      },
    );
  }
}
