import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/common/colors/app_colors.dart';

AppBar customAppBar(
    {required String title,
    required BuildContext context,
    SystemUiOverlayStyle? systemOverlayStyle,
    List<Widget>? actions,
    bool isBack=true,
    VoidCallback? onPressed,
    }) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    centerTitle: false,
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    toolbarHeight: 50.h,
    title: Text(
      title,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: 18.sp,
            color: AppColors().white
          ),
    ),
    leading:isBack? IconButton(
        onPressed:onPressed?? () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors().white,
          size: 22.w
        )):null,
    actions: actions,
  );
}
