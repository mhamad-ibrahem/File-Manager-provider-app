
import 'dart:io';

import 'package:file_manger_app/core/helpers/date_time/date_time_helper.dart';
import 'package:file_manger_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
showFileInfoDialog(
  BuildContext context,
  File file,
) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
         'Name : ${basename(file.path)}',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 14.sp),
        ),
          backgroundColor: Theme.of(context).primaryColorDark,
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Size : ${(file.lengthSync()/(1024*8)).round()}MB",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14.sp),),
              SizedBox(height: 10.h,),
              Text("Last modified : ${DateTimeHelper.dateAndTimeFormat(file.lastModifiedSync())}",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14.sp),),
               SizedBox(height: 10.h,),
               CustomButton(buttonBody: 'Back', onTap: (){
                Navigator.pop(context);
               })
            ],
          ),
        ),
      ));
}
