import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../config/config.dart';
import '../core.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceSize.width,
      color: appColor.black.withOpacity(.2),
      padding: Dimensions.kPaddingAllLarge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: Dimensions.kPaddingAllMedium,
            decoration: BoxDecoration(
              color: appColor.white,
              borderRadius: Dimensions.kBorderRadiusAllSmall,
              boxShadow: [
                BoxShadow(
                  color: appColor.grayBlue700.withOpacity(.1),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 6,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AppLottie.iosLoading, width: 26.w),
                Dimensions.kHorizontalSpaceMedium,
                Text(
                  "Loading...",
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: appColor.gray500, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
