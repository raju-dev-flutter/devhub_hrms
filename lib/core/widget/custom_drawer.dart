import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/app.dart';
import '../../config/config.dart';
import '../core.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final methodChannel = const MethodChannel(AppKeys.methodChannel);

  Future<void> stopService() async {
    try {
      await methodChannel.invokeMethod("stop", <String, dynamic>{});
    } catch (e) {
      Log.e("Error while accessing native call");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.deviceSize.width,
      backgroundColor: appColor.gray50,
      shape: const BeveledRectangleBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [],
      ),
    );
  }
}
