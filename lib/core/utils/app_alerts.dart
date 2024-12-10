import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../config/config.dart';
import '../../core/core.dart';

class AppAlerts {
  const AppAlerts._();

  /// DISPLAY A SNACK_BAR WITH A MESSAGE AND SUCCESS OR ERROR INDICATOR
  static displaySnackBar(BuildContext context, String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8).w,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).w,
          decoration: BoxDecoration(
            color: isSuccess ? appColor.success100 : appColor.error100,
            borderRadius: Dimensions.kBorderRadiusAllSmallest,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(isSuccess ? Icons.task_alt_rounded : Icons.error,
                  color: isSuccess ? appColor.success600 : appColor.error600),
              Dimensions.kHorizontalSpaceSmaller,
              Expanded(
                child: Text(
                  message,
                  style: context.textTheme.bodySmall?.copyWith(
                      color:
                          isSuccess ? appColor.success600 : appColor.error600),
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  /// DISPLAY AN ERROR ALERT WITH A TITLE AND MESSAGE
  static displayErrorAlert(BuildContext context, String title, String message) {
    showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          Future.delayed(
              const Duration(seconds: 2), () => Navigator.of(context).pop());
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                topContainer(
                  context: context,
                  backgroundColor: appColor.error600,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: appColor.white),
                  ),
                ),
                bottomContainer(
                  context: context,
                  child: Column(
                    children: [
                      Dimensions.kVerticalSpaceSmallest,
                      Lottie.asset(repeat: false, AppLottie.error, width: 70),
                      Dimensions.kVerticalSpaceSmall,
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: appColor.error600),
                      ),
                      Dimensions.kVerticalSpaceLarge,
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  // DISPLAY A WARNING ALERT WITH A TITLE AND MESSAGE
  static displayWarningAlert(
      BuildContext context, String title, String message) {
    showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          Future.delayed(
              const Duration(seconds: 2), () => Navigator.of(context).pop());
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                topContainer(
                  context: context,
                  backgroundColor: appColor.warning600,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: appColor.white),
                  ),
                ),
                bottomContainer(
                  context: context,
                  child: Column(
                    children: [
                      Dimensions.kVerticalSpaceSmallest,
                      Lottie.asset(repeat: false, AppLottie.warning, width: 70),
                      Dimensions.kVerticalSpaceSmall,
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: appColor.warning600),
                      ),
                      Dimensions.kVerticalSpaceLarge,
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// DISPLAY A SUCCESS ALERT WITH A TITLE AND MESSAGE
  static displaySuccessAlert(
      BuildContext context, String title, String message) {
    showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          Future.delayed(const Duration(seconds: 2),
              () => {Navigator.of(context).pop(true)});
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                topContainer(
                  context: context,
                  backgroundColor: appColor.success600,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: appColor.white),
                  ),
                ),
                bottomContainer(
                  context: context,
                  child: Column(
                    children: [
                      Dimensions.kVerticalSpaceSmallest,
                      Lottie.asset(repeat: false, AppLottie.success, width: 70),
                      Dimensions.kVerticalSpaceSmall,
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: appColor.success600),
                      ),
                      Dimensions.kVerticalSpaceLarge,
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// DISPLAY A LOGOUT ALERT WITH AN ACTION CALLBACK
  static displayLogoutAlert(
      {required BuildContext context, required VoidCallback onPressed}) {
    showAdaptiveDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                topContainer(
                  context: context,
                  backgroundColor: appColor.brand600,
                  child: Text(
                    "Log out",
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: appColor.white, fontWeight: FontWeight.bold),
                  ),
                ),
                bottomContainer(
                  context: context,
                  child: Column(
                    children: [
                      Dimensions.kVerticalSpaceSmallest,
                      Text(
                        "Are you sure you want to logout ?",
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: appColor.brand800),
                      ),
                      Dimensions.kVerticalSpaceLarge,
                      Row(
                        children: [
                          Dimensions.kHorizontalSpaceMedium,
                          Expanded(
                            child: CustomButton(
                              height: 44,
                              onPressed: () => Navigator.pop(context),
                              color: appColor.error600,
                              child: Text(
                                "No",
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodySmall
                                    ?.copyWith(color: appColor.white),
                              ),
                            ),
                          ),
                          Dimensions.kHorizontalSpaceSmall,
                          Expanded(
                            child: CustomButton(
                              height: 44,
                              onPressed: onPressed,
                              color: appColor.success600,
                              child: Text(
                                "Yes",
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodySmall
                                    ?.copyWith(color: appColor.white),
                              ),
                            ),
                          ),
                          Dimensions.kHorizontalSpaceMedium,
                        ],
                      ),
                      Dimensions.kVerticalSpaceSmallest,
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// HELPER METHOD TO CREATE THE TOP CONTAINER OF AN ALERT DIALOG
  static topContainer(
      {required BuildContext context,
      required Color backgroundColor,
      required Widget child}) {
    return Container(
      padding: Dimensions.kPaddingAllSmall,
      width: context.deviceSize.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ).w,
      ),
      child: child,
    );
  }

  /// HELPER METHOD TO CREATE THE BOTTOM CONTAINER OF AN ALERT DIALOG
  static bottomContainer(
      {required BuildContext context,
      required Widget child,
      EdgeInsetsGeometry? padding}) {
    return Container(
      width: context.deviceSize.width,
      padding: padding ?? Dimensions.kPaddingAllMedium,
      decoration: BoxDecoration(
        color: appColor.gray50,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ).w,
      ),
      child: child,
    );
  }
}
