import 'package:devhub_hrms/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 210.h,
            color: appColor.white,
            child: Stack(
              children: [
                Container(
                  width: context.deviceSize.width,
                  height: 80.h,
                  color: appColor.brand800,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: context.deviceSize.width,
                    padding: Dimensions.kPaddingAllMedium,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const _ProfileImageWidget(),
                            Container(
                              width: 150,
                              height: 46,
                              margin: const EdgeInsets.only(bottom: 6),
                              decoration: BoxDecoration(
                                color: appColor.gray200,
                                borderRadius:
                                    Dimensions.kBorderRadiusAllSmallest,
                              ),
                            ),
                          ],
                        ),
                        Dimensions.kVerticalSpaceSmall,
                        Text(
                          "RAJASEKAR VENKATESAN".toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.headlineMedium?.copyWith(
                              letterSpacing: .3, color: appColor.gray800),
                        ),
                        Dimensions.kVerticalSpaceSmallest,
                        Text(
                          "Mobile App Developer",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelMedium?.copyWith(
                              letterSpacing: .3, color: appColor.gray800),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Dimensions.kVerticalSpaceMedium,
          _ProfileHeaderBodyWidget(
            header: 'Personal',
            onPressed: () {},
            children: [
              const _ProfileContentWidget(
                  text: "Rajasekar", icon: Icons.person),
              Divider(color: appColor.gray200, thickness: 1, height: 0),
              const _ProfileContentWidget(
                  text: "05-07-1998 | 26", icon: Icons.date_range_rounded),
              Divider(color: appColor.gray200, thickness: 1, height: 0),
              const _ProfileContentWidget(text: "Male", icon: Icons.person),
            ],
          ),
          Dimensions.kVerticalSpaceMedium,
          _ProfileHeaderBodyWidget(
            header: 'Contact',
            onPressed: () {},
            children: [
              _ProfileContentWidget(
                text: "vrajasekar.ei@gmail.com",
                icon: Icons.email,
                onCopy: () {},
              ),
              Divider(color: appColor.gray200, thickness: 1, height: 0),
              _ProfileContentWidget(
                text: "+91 908 765 4323",
                icon: Icons.phone,
                onCopy: () {},
              ),
              Divider(color: appColor.gray200, thickness: 1, height: 0),
              _ProfileContentWidget(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                icon: Icons.location_on,
                onCopy: () {},
              ),
            ],
          ),
          Dimensions.kVerticalSpaceMedium,
          _ProfileHeaderBodyWidget(
            header: 'Education',
            onPressed: () {},
            children: [
              _ProfileContentWidget(
                text: "B.Tech Information Technology",
                icon: Icons.account_balance,
                onCopy: () {},
              ),
              Divider(color: appColor.gray200, thickness: 1, height: 0),
              _ProfileContentWidget(
                text: "2020 Batch",
                icon: Icons.date_range,
                onCopy: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileImageWidget extends StatelessWidget {
  const _ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            color: appColor.gray400,
            borderRadius: Dimensions.kBorderRadiusAllLargest,
            border: Border.all(
              color: appColor.white,
              width: 4,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            boxShadow: [
              BoxShadow(
                color: appColor.gray50.withOpacity(.2),
                offset: const Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 3,
              )
            ],
          ),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: Container(
            height: 18.h,
            width: 18.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: appColor.blue600,
              borderRadius: Dimensions.kBorderRadiusAllSmall,
              border: Border.all(
                color: appColor.white,
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: Icon(Icons.edit, size: 12, color: appColor.white),
          ),
        )
      ],
    );
  }
}

class _ProfileHeaderBodyWidget extends StatelessWidget {
  final String header;
  final VoidCallback onPressed;
  final List<Widget> children;
  const _ProfileHeaderBodyWidget(
      {required this.header, required this.onPressed, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: Dimensions.kPaddingAllMedium,
        decoration: BoxDecoration(
          color: appColor.white,
          borderRadius: Dimensions.kBorderRadiusAllSmallest,
          boxShadow: [
            BoxShadow(
              color: appColor.gray200.withOpacity(.2),
              offset: const Offset(0, 3),
              blurRadius: 12,
              spreadRadius: 3,
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  header.toUpperCase(),
                  style: context.textTheme.labelLarge?.copyWith(
                      color: appColor.gray800, fontWeight: FontWeight.w600),
                ),
                Dimensions.kSpacer,
                InkWell(
                  onTap: onPressed,
                  child: Text(
                    "Edit",
                    style: context.textTheme.labelMedium?.copyWith(
                        color: appColor.indigo600, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Dimensions.kVerticalSpaceSmall,
            Container(
              decoration: BoxDecoration(
                color: appColor.gray50,
                borderRadius: Dimensions.kBorderRadiusAllSmallest,
                border: Border.all(
                  color: appColor.gray200,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
              child: Column(children: children),
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileContentWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onCopy;
  const _ProfileContentWidget(
      {required this.text, required this.icon, this.onCopy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.kPaddingAllSmall,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: appColor.gray500,
            size: 20.w,
          ),
          Dimensions.kHorizontalSpaceSmaller,
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelLarge?.copyWith(
                  color: appColor.gray500, fontWeight: FontWeight.w600),
            ),
          ),
          Dimensions.kHorizontalSpaceSmaller,
          if (onCopy != null)
            InkWell(
              onTap: onCopy,
              child: Icon(
                Icons.copy,
                color: appColor.indigo600,
                size: 16.w,
              ),
            )
        ],
      ),
    );
  }
}
