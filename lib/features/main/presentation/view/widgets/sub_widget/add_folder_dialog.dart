import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../widgets/buttons/custom_button.dart';
import '../../../../../../widgets/fields/custom_text_form_field.dart';
import '../../../provider/main_provider.dart';

editAndAddFolderDialog(BuildContext context, bool isEdit,bool isFile) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(
              '${isEdit ? 'Update' : 'Create'} a Folder',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14.sp),
            ),
            backgroundColor: Theme.of(context).primaryColorDark,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: context.read<MainProvider>().formKey,
                    child: CustomTextFormField(
                      textEditingController: context.read<MainProvider>().name,
                      radius: 12,
                      hint: 'name',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                      validator: (p0) {
                        if (p0!.trim().isEmpty) {
                          return "Can't be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                              radius: 12.r,
                              buttonBody: 'Back',
                              buttonColor: AppColors().black,
                              onTap: () {
                                Navigator.pop(context);
                              })),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: CustomButton(
                            radius: 12.r,
                            buttonBody: isEdit ? 'Update' : 'Create',
                            onTap: () {
                              if (context
                                  .read<MainProvider>()
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                if (isEdit) {
                                  context.read<MainProvider>().editFolderOrFile(
                                    isFile: isFile,
                                        oldDirPath:
                                            "${context.read<MainProvider>().directory.path}/${context.read<MainProvider>().oldDirPath}",
                                        dirPath:
                                            "${context.read<MainProvider>().directory.path}/${context.read<MainProvider>().name.text}",
                                        context: context,
                                        voidCallback: () {
                                          context
                                              .read<MainProvider>()
                                              .getData();
                                        },
                                      );
                                  context.read<MainProvider>().name.clear();
                                } else {
                                  context.read<MainProvider>().createFolder(
                                        name: context.read<MainProvider>().name,
                                        path: context
                                            .read<MainProvider>()
                                            .directory
                                            .path,
                                        context: context,
                                        voidCallback: () {
                                          context
                                              .read<MainProvider>()
                                              .getData();
                                        },
                                      );
                                }
                              }
                            }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
}
