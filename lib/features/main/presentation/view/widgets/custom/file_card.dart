import 'dart:io';
import 'package:file_manger_app/core/common/colors/app_colors.dart';
import 'package:file_manger_app/core/helpers/log_helper/log_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../provider/main_provider.dart';
import '../sub_widget/file_info_dialog.dart';
import '../sub_widget/add_folder_dialog.dart';

class FileCardWidget extends StatelessWidget {
  const FileCardWidget(
      {super.key,
      this.onTap,
      required this.title,
      required this.isFile,
      this.entity});
  final void Function()? onTap;
  final String title;
  final bool isFile;
  final FileSystemEntity? entity;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.5,
      color: Theme.of(context).primaryColorDark,
      child: ListTile(
        leading: isFile
            ? Icon(
                Icons.feed_outlined,
                size: 24.w,
                color: AppColors.primaryColor,
              )
            : Icon(
                Icons.folder,
                size: 24.w,
                color: AppColors.primaryColor,
              ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 13.sp),
        ),
        onTap: onTap,
        trailing: SizedBox(
          width: 110.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<MainProvider>().initName(title);
                  editAndAddFolderDialog(context, true,isFile);
                },
                child: Icon(
                  Icons.edit,
                  size: 24.w,
                  color: AppColors().black,
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  LogHelper.logCyan("delete");
                  context.read<MainProvider>().deleteFolderOrFile(
                      context: context,
                      dirPath:
                          "${context.read<MainProvider>().directory.path}/$title",
                      voidCallback: () {
                        context.read<MainProvider>().getData();
                      });
                },
                child: Icon(
                  Icons.delete_outline_outlined,
                  size: 24.w,
                  color: AppColors().red,
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              if (isFile)
                GestureDetector(
                  onTap: () {
                    File file = File(entity!.path);
                    showFileInfoDialog(context, file);
                  },
                  child: Icon(
                    Icons.info,
                    size: 24.w,
                    color: AppColors().green,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
