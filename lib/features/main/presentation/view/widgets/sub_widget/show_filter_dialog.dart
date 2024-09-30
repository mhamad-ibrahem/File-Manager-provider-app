import 'package:file_manger_app/core/common/size/app_size.dart';
import 'package:file_manger_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../widgets/buttons/custom_delete_button.dart';
import '../../../provider/main_provider.dart';

showMainFilterDialog(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (_) => Stack(
            children: [
              AlertDialog(
                title: Text(
                  'Filter by extension',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14.sp),
                ),
                  backgroundColor: Theme.of(context).primaryColorDark,
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: CustomButton(
                                  buttonBody: 'All',
                                  onTap: () {
                                    context.read<MainProvider>().getData();
                                    Navigator.pop(context);
                                  })),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: CustomButton(
                                  buttonBody: 'Png',
                                  onTap: () {
                                    context.read<MainProvider>().getData();
                                    context.read<MainProvider>().files = context
                                        .read<MainProvider>()
                                        .filterFiles(
                                            context: context,
                                            files: context
                                                .read<MainProvider>()
                                                .files,
                                            extensionType: '.png');
                                  })),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: CustomButton(
                                  buttonBody: 'Jpg',
                                  onTap: () {
                                    context.read<MainProvider>().getData();
                                    context.read<MainProvider>().files = context
                                        .read<MainProvider>()
                                        .filterFiles(
                                            context: context,
                                            files: context
                                                .read<MainProvider>()
                                                .files,
                                            extensionType: '.jpg');
                                  })),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomButton(
                                  buttonBody: 'Mp3',
                                  onTap: () {
                                    context.read<MainProvider>().getData();
                                    context.read<MainProvider>().files = context
                                        .read<MainProvider>()
                                        .filterFiles(
                                            context: context,
                                            files: context
                                                .read<MainProvider>()
                                                .files,
                                            extensionType: '.mp3');
                                  })),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: CustomButton(
                                  buttonBody: 'Mp4',
                                  onTap: () {
                                    context.read<MainProvider>().getData();
                                    context.read<MainProvider>().files = context
                                        .read<MainProvider>()
                                        .filterFiles(
                                            context: context,
                                            files: context
                                                .read<MainProvider>()
                                                .files,
                                            extensionType: '.mp4');
                                  })),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: CustomButton(
                                  buttonBody: 'Pdf',
                                  onTap: () {
                                    context.read<MainProvider>().getData();
                                    context.read<MainProvider>().files = context
                                        .read<MainProvider>()
                                        .filterFiles(
                                            context: context,
                                            files: context
                                                .read<MainProvider>()
                                                .files,
                                            extensionType: '.pdf');
                                  })),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: AppSize.screenHeight(context: context) * 0.34,
                  right: 30,
                  child: const CustomExitButton()),
            ],
          ));
}
