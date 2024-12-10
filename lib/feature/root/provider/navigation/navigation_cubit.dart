import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

enum NavbarItem { dashboard, home, calendar, setting }

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.dashboard, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.dashboard:
        emit(const NavigationState(NavbarItem.dashboard, 0));
        break;

      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 1));
        break;

      case NavbarItem.calendar:
        emit(const NavigationState(NavbarItem.calendar, 2));
        break;

      case NavbarItem.setting:
        emit(const NavigationState(NavbarItem.setting, 3));
        break;
    }
  }
}
