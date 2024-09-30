import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/colors/app_colors.dart';


class LoadingWidget extends StatelessWidget {
  final Color? color;
  const LoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 40.h,
      child: CircularProgressIndicator(
        color: color ?? AppColors.primaryColor,
      ),
    );
  }
}
