import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';

class DashboardAppbarWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DashboardAppbarWidget({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 43.w,
              height: 43.h,
              decoration: BoxDecoration(
                borderRadius: Dimensions.kBorderRadiusAllLarger,
                color: appColor.brand200,
                image:
                    const DecorationImage(image: AssetImage(AppIcon.profile)),
              ),
            ),
            Dimensions.kHorizontalSpaceSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Good Morning!",
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: appColor.gray500),
                  ),
                  Text(
                    "Rajasekar Venkatesan " "👋",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: appColor.gray800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            AppSvg.menu,
            width: 18,
            colorFilter: ColorFilter.mode(appColor.gray700, BlendMode.srcIn),
          ),
        ),
      ],
      backgroundColor: appColor.white,
    );
  }
}
