import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/theme/provider/theme_provider.dart';
import '../../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../../widgets/switches/custom_switch.dart';
import '../../provider/main_provider.dart';
import 'sub_widget/main_sorting_dialog.dart';
import 'sub_widget/show_filter_dialog.dart';

AppBar mainAppBar({
  bool isBack = true,
  void Function()? onPressed,
  required BuildContext context,
}) {
  return customAppBar(
    isBack:
        context.read<MainProvider>().directory.path != '/storage/emulated/0',
    title: context.read<MainProvider>().selectedFileIndex == -1
        ? 'File Manager'
        : context
            .read<MainProvider>()
            .files[context.read<MainProvider>().selectedFileIndex]
            .path
            .split('/')
            .last,
    context: context,
    actions: [
      IconButton(
          onPressed: () {
            showMainSortDialog(context);
          },
          icon: Icon(
            Icons.sort_rounded,
            color: AppColors().white,
            size: 24.w,
          )),
      IconButton(
          onPressed: () {
            showMainFilterDialog(context);
          },
          icon: Icon(
            Icons.filter_alt_off_rounded,
            color: AppColors().white,
            size: 24.w,
          )),
     Consumer<ThemeProvider>(
       builder: (context, themeProvider, child) {
         return CustomSwitch(
           activeColor: AppColors().green,
           value: themeProvider.isDarkMode,
           onChanged: (p0) {
             themeProvider.changeTheme();
           },
         );
       },
     ),
    ],
    onPressed: () {
      context.read<MainProvider>().onBackPress();
    },
  );
}
