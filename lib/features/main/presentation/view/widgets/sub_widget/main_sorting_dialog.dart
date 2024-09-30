import 'package:file_manger_app/core/common/size/app_size.dart';
import 'package:file_manger_app/features/main/presentation/provider/main_provider.dart';
import 'package:file_manger_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../widgets/buttons/custom_delete_button.dart';
import '../../../provider/sub_provider/sort_and_filter_folders_provider.dart';

showMainSortDialog(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (_) => Stack(
            children: [
              AlertDialog(
                title: Text(
                  'Sort by',
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
                                  buttonBody: 'Name',
                                  onTap: () {
                                    context.read<MainProvider>().sortFolderBy(
                                        context: context,
                                        sortBy: SortBy.name,
                                        files:
                                            context.read<MainProvider>().files);
                                  })),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: CustomButton(
                                  buttonBody: 'Size',
                                  onTap: () {
                                    context.read<MainProvider>().sortFolderBy(
                                        context: context,
                                        sortBy: SortBy.size,
                                        files:
                                            context.read<MainProvider>().files);
                                  })),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: CustomButton(
                                  buttonBody: 'Date',
                                  onTap: () {
                                    context.read<MainProvider>().sortFolderBy(
                                        context: context,
                                        sortBy: SortBy.date,
                                        files:
                                            context.read<MainProvider>().files);
                                  })),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: AppSize.screenHeight(context: context) * 0.375,
                  right: 30,
                  child: const CustomExitButton()),
            ],
          ));
}
