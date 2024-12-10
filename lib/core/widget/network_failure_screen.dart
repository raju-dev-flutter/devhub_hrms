import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../config/config.dart';
import '../core.dart';

class NetworkFailureScreen extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;

  const NetworkFailureScreen({super.key, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color ?? Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(AppLottie.networkFailure, width: 250.w),
          Text(
            "Network Error...!",
            style: context.textTheme.bodySmall,
          ),
          if (onPressed != null) ...[
            Dimensions.kVerticalSpaceSmall,
            InkWell(
              onTap: onPressed,
              borderRadius: Dimensions.kBorderRadiusAllSmallest,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6).w,
                decoration: BoxDecoration(
                  borderRadius: Dimensions.kBorderRadiusAllSmallest,
                  border: Border.all(width: 1, color: appColor.error800),
                ),
                child: Text(
                  "RELOAD",
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: appColor.error800),
                ),
              ),
            ),
            Dimensions.kVerticalSpaceLargest,
          ]
        ],
      ),
    );
  }
}
