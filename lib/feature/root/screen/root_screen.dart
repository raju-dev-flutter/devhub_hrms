import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';
import '../../feature.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final navigationCubit = BlocProvider.of<NavigationCubit>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: appColor.background,
      appBar: PreferredSize(
        preferredSize: Size(context.deviceSize.width, 58.h),
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state.navbarItem == NavbarItem.dashboard) {
              return DashboardAppbarWidget(scaffoldKey: _scaffoldKey);
            } else if (state.navbarItem == NavbarItem.home) {
              return DashboardAppbarWidget(scaffoldKey: _scaffoldKey);
            } else if (state.navbarItem == NavbarItem.calendar) {
              return DashboardAppbarWidget(scaffoldKey: _scaffoldKey);
            } else if (state.navbarItem == NavbarItem.setting) {
              return DashboardAppbarWidget(scaffoldKey: _scaffoldKey);
            }
            return DashboardAppbarWidget(scaffoldKey: _scaffoldKey);
          },
        ),
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.dashboard) {
          return const DashboardScreen();
        } else if (state.navbarItem == NavbarItem.home) {
          return const HomeScreen();
        } else if (state.navbarItem == NavbarItem.calendar) {
          return const CalendarScreen();
        } else if (state.navbarItem == NavbarItem.setting) {
          return const SettingScreen();
        }
        return Container();
      }),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Container(
            height: 72.h,
            width: context.deviceSize.width,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: appColor.white),
              gradient: appColor.glassGradient,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x2888909F),
                  offset: Offset(0, 6),
                  blurRadius: 11,
                ),
              ],
            ),
            child: Row(
              children: [
                _NavigationItem(
                  onPressed: () =>
                      navigationCubit.getNavBarItem(NavbarItem.dashboard),
                  label: 'Dashboard',
                  icon: state.index == 0
                      ? AppSvg.dashboardFill
                      : AppSvg.dashboardOutline,
                  color: state.index == 0 ? appColor.brand800 : null,
                ),
                _NavigationItem(
                  onPressed: () =>
                      navigationCubit.getNavBarItem(NavbarItem.home),
                  label: 'Home',
                  icon: state.index == 1 ? AppSvg.homeFill : AppSvg.homeOutline,
                  color: state.index == 1 ? appColor.brand800 : null,
                ),
                // _NavigationItem(
                //   onPressed: () =>
                //       navigationCubit.getNavBarItem(NavbarItem.calendar),
                //   label: 'Calender',
                //   icon: state.index == 2
                //       ? AppSvg.calendarFill
                //       : AppSvg.calendarOutline,
                //   color: state.index == 2 ? appColor.brand800 : null,
                // ),
                _NavigationItem(
                  onPressed: () =>
                      navigationCubit.getNavBarItem(NavbarItem.setting),
                  label: 'Settings',
                  icon: state.index == 3
                      ? AppSvg.settingFill
                      : AppSvg.settingOutline,
                  color: state.index == 3 ? appColor.brand800 : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onPressed;
  final Color? color;

  const _NavigationItem(
      {required this.icon,
      required this.label,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: color ?? Colors.transparent),
            ),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
                width: 20.w,
                colorFilter: ColorFilter.mode(
                  color ?? appColor.gray400,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: context.textTheme.labelSmall?.copyWith(
                  letterSpacing: .5,
                  color: color ?? appColor.gray400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
