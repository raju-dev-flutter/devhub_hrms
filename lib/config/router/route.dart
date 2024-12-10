import 'package:devhub_hrms/feature/attendance/screen/attendance_screen.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /// ========= [Attendance Route] ========= \\\

      case AppRouterPath.attendance:
        return MaterialPageRoute(builder: (_) => const AttendanceScreen());

      // case AppRouterPath.locationHistoryReportScreen:
      //   final arg = settings.arguments as LocationHistoryReportScreen;
      //   return MaterialPageRoute(
      //       builder: (_) => LocationHistoryReportScreen(user: arg.user));

      /// ========= [No Route view] ========= \\\
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(body: Center(child: Text('No route defined')));
        });
    }
  }
}
