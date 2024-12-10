import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';

class MenuItemModel {
  final String label;
  final String key;
  final String? value;
  final String icon;
  final Color? color;

  const MenuItemModel._({
    required this.key,
    required this.label,
    required this.icon,
    this.value,
    this.color,
  });

  factory MenuItemModel.create(MenuItemType type) {
    switch (type) {
      case MenuItemType.leaveRequest:
        return MenuItemModel._(
          icon: AppSvg.leaveRequest,
          label: 'Leave Request',
          color: appColor.brand600,
          key: 'leave_request',
          value: '',
        );
      case MenuItemType.leaveApproval:
        return MenuItemModel._(
          icon: AppSvg.leaveApproval,
          label: 'Leave Approval',
          color: appColor.warning600,
          key: 'leave_approval',
          value: '',
        );
      case MenuItemType.leaveHistory:
        return MenuItemModel._(
          icon: AppSvg.leaveHistory,
          label: 'Leave History',
          color: appColor.success600,
          key: 'leave_history',
          value: '',
        );
      case MenuItemType.odPermissionRequest:
        return MenuItemModel._(
          icon: AppSvg.odPermissionRequest,
          label: 'Od | Permission Request',
          color: appColor.fuchsia600,
          key: 'od_permission_request',
          value: '',
        );
      case MenuItemType.odPermissionApproval:
        return MenuItemModel._(
          icon: AppSvg.odPermissionApproval,
          label: 'Od | Permission Approval',
          color: appColor.indigo600,
          key: 'od_permission_approval',
          value: '',
        );
      case MenuItemType.odPermissionHistory:
        return MenuItemModel._(
          icon: AppSvg.odPermissionHistory,
          label: 'Od | Permission History',
          color: appColor.purple600,
          key: 'od_permission_history',
          value: '',
        );
      case MenuItemType.missPunchRequest:
        return MenuItemModel._(
          icon: AppSvg.missPunchRequest,
          label: 'Misspunch Request',
          color: appColor.pink600,
          key: 'misspunch_request',
          value: '',
        );
      case MenuItemType.missPunchApproval:
        return MenuItemModel._(
          icon: AppSvg.missPunchApproval,
          label: 'Misspunch Approval',
          color: appColor.orangeDark600,
          key: 'misspunch_approval',
          value: '',
        );
      case MenuItemType.missPunchHistory:
        return MenuItemModel._(
          icon: AppSvg.missPunchHistory,
          label: 'Misspunch History',
          color: appColor.indigo600,
          key: 'misspunch_history',
          value: '',
        );
    }
  }

  static List<MenuItemModel> getPages() {
    return MenuItemType.values
        .map((type) => MenuItemModel.create(type))
        .toList();
  }
}

enum MenuItemType {
  leaveRequest,
  leaveApproval,
  leaveHistory,
  odPermissionRequest,
  odPermissionApproval,
  odPermissionHistory,
  missPunchRequest,
  missPunchApproval,
  missPunchHistory,
}
