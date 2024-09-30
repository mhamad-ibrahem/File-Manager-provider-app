import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/log_helper/log_helper.dart';

class AppCherryToast {
  static showErrorToast(
      {required String errorMessage, required BuildContext context}) {
    LogHelper.logError(errorMessage);
    CherryToast.error(
            backgroundColor: Theme.of(context).primaryColorDark,
            title: Text(
              errorMessage,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 14.sp),
            ),
            animationType: AnimationType.fromRight,
            animationDuration: const Duration(milliseconds: 1000),
            autoDismiss: true)
        .show(context);
  }

  static showSuccessToast(
      {required String message, required BuildContext context}) {
    LogHelper.logSuccess(message);
    CherryToast.success(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 14.sp),
        )).show(context);
  }
}
