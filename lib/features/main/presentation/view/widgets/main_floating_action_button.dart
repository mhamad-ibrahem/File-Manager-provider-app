import 'package:file_manger_app/features/main/presentation/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/colors/app_colors.dart';
import 'sub_widget/add_folder_dialog.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MainProvider>().name.clear();
        editAndAddFolderDialog(context, false, false);
      },
      child: Container(
        height: 40.h,
        width: 40.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.primaryColor,
        ),
        child: Icon(
          Icons.add,
          size: 24.w,
          color: AppColors().white,
        ),
      ),
    );
  }
}
