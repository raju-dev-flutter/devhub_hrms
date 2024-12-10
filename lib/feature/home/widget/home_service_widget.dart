import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/config.dart';
import '../home.dart';

class HomeServiceWidget extends StatelessWidget {
  const HomeServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItemModel> menuItem = MenuItemModel.getPages();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: appColor.white,
            borderRadius: Dimensions.kBorderRadiusAllSmaller,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Services".toUpperCase(),
                    style: context.textTheme.labelLarge?.copyWith(
                        color: appColor.gray600, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              // Dimensions.kVerticalSpaceSmall,
            ],
          ),
        ),
        Dimensions.kVerticalSpaceSmall,
        Wrap(
          runSpacing: 6.w,
          spacing: 6.w,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            for (var page in menuItem) ...[
              InkWell(
                // onTap: () => gotoNextPage(context, page.label),
                borderRadius: BorderRadius.circular(8).w,
                child: Container(
                  width: 168.w,
                  height: 70.h,
                  padding: Dimensions.kPaddingAllMedium,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8).w,
                    color: appColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: appColor.gray200.withOpacity(.4),
                        offset: const Offset(0, 3),
                        spreadRadius: 3,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          page.icon,
                          width: 30.w,
                          colorFilter:
                              ColorFilter.mode(page.color!, BlendMode.srcIn),
                        ),
                      ),
                      Dimensions.kHorizontalSpaceSmall,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              page.label,
                              style: context.textTheme.labelMedium?.copyWith(
                                  color: appColor.gray600,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
