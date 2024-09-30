import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'loading_widget.dart';

class PaginationLoading extends StatelessWidget {
  const PaginationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 25.h,
      width: 25.w,
      child: const LoadingWidget(),
    );
  }
}
