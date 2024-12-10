import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 1,
            thickness: 0,
            color: appColor.blueDark600.withOpacity(.2),
          ),
          const _SettingCardWidget(),
          Dimensions.kVerticalSpaceSmaller,
          const _SettingServiceWidget(),
        ],
      ),
    );
  }
}

class _SettingCardWidget extends StatelessWidget {
  const _SettingCardWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.kPaddingAllMedium,
      color: appColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style: context.textTheme.titleLarge
                ?.copyWith(color: appColor.brand900),
          ),
          Dimensions.kVerticalSpaceSmaller,
          const _SettingLabelItemWidget(
            label: 'Employee Number',
            value: 'EMP001',
          ),
          SizedBox(height: 4.h),
          const _SettingLabelItemWidget(
            label: 'Email',
            value: 'example@gmail.com',
          ),
          SizedBox(height: 4.h),
          const _SettingLabelItemWidget(
            label: 'Phone number',
            value: '+91 9876543210',
            isLastItem: true,
          ),
        ],
      ),
    );
  }
}

class _SettingServiceWidget extends StatelessWidget {
  const _SettingServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.kPaddingAllMedium,
      color: appColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: context.textTheme.titleLarge
                ?.copyWith(color: appColor.brand900),
          ),
          Dimensions.kVerticalSpaceSmall,
          _SettingsLinkWidget(
            label: 'Change Password',
            icon: Icons.lock_open,
            onPressed: () {},
          ),
          Dimensions.kVerticalSpaceSmall,
          _SettingsLinkWidget(
            label: 'Help',
            icon: Icons.help,
            onPressed: () {},
          ),
          Dimensions.kVerticalSpaceSmall,
          _SettingsLinkWidget(
            label: 'Invite Teams',
            icon: Icons.share_rounded,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _SettingLabelItemWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool? isLastItem;

  const _SettingLabelItemWidget(
      {required this.label, required this.value, this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: context.textTheme.labelLarge),
        SizedBox(height: 1.h),
        Text(
          label,
          style:
              context.textTheme.labelSmall?.copyWith(color: appColor.gray700),
        ),
        SizedBox(height: 4.h),
        if (isLastItem != true)
          Divider(color: appColor.brand900.withOpacity(.1)),
      ],
    );
  }
}

class _SettingsLinkWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const _SettingsLinkWidget(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(icon, size: 16.sp, color: appColor.gray700),
          Dimensions.kHorizontalSpaceSmallest,
          Text(label,
              style: context.textTheme.labelLarge
                  ?.copyWith(color: appColor.gray700)),
          Dimensions.kSpacer,
          Icon(Icons.arrow_forward_ios_rounded,
              size: 16.sp, color: appColor.gray700),
        ],
      ),
    );
  }
}
