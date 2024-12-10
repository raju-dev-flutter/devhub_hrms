import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';

class HomeAttendanceStatusWidget extends StatelessWidget {
  const HomeAttendanceStatusWidget({super.key});

  String getCurrentDate() {
    final splitDate = DateFormat('yyyy-MM-dd hh:mm')
        .format(DateTime.now())
        .split(' ')[0]
        .split('-');

    int year = int.parse(splitDate[0]);
    int date = int.parse(splitDate[1]);
    int month = int.parse(splitDate[2]);
    DateTime now = DateTime(year, date, month);

    return '${Convert.day(now)}, ${splitDate[2]} ${Convert.month(now)} $year';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.kPaddingAllSmaller,
      decoration: BoxDecoration(
        color: appColor.white,
        borderRadius: Dimensions.kBorderRadiusAllSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dimensions.kVerticalSpaceSmaller,
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 8, right: 4).w,
            child: Row(
              children: [
                Text(
                  "Attendance Status".toUpperCase(),
                  style: context.textTheme.labelLarge?.copyWith(
                      color: appColor.gray600, fontWeight: FontWeight.w400),
                ),
                Dimensions.kSpacer,
                Text(
                  getCurrentDate().toUpperCase(),
                  style: context.textTheme.labelMedium
                      ?.copyWith(color: appColor.gray600),
                ),
              ],
            ),
          ),
          Dimensions.kVerticalSpaceSmall,
          Row(
            children: [
              const _AttendanceStatusWidget(
                label: "Check In",
                icon: AppSvg.crossArrowDown,
                time: "00:00:00",
              ),
              Dimensions.kHorizontalSpaceSmaller,
              const _AttendanceStatusWidget(
                label: "Check Out",
                icon: AppSvg.crossArrowUp,
                time: "00:00:00",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AttendanceStatusWidget extends StatelessWidget {
  final String label, icon, time;

  const _AttendanceStatusWidget(
      {required this.label, required this.icon, required this.time});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, AppRouterPath.attendance),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).w,
            color: appColor.background,
            border: Border.all(width: 1, color: appColor.white),
            boxShadow: [
              BoxShadow(
                color: appColor.background.withOpacity(.2),
                offset: const Offset(0, 3),
                spreadRadius: 6,
                blurRadius: 12,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(8).w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: appColor.brand950.withOpacity(.1),
                      borderRadius: Dimensions.kBorderRadiusAllMedium,
                    ),
                    child: SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(
                        appColor.brand950,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    label,
                    style: context.textTheme.titleLarge?.copyWith(
                        color: appColor.brand950, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Text(
                time.toUpperCase(),
                style: context.textTheme.headlineLarge?.copyWith(
                  color: appColor.brand950,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
