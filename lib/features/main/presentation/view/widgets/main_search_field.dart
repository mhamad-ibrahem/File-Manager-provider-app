import 'package:file_manger_app/features/main/presentation/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/widgets/field/search_field_widget.dart';

class MainSearchFieldWidget extends StatelessWidget {
  const MainSearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      child: SearchFieldWidget(
        searchTextEditingController:
            context.read<MainProvider>().searchTextEditingController,
        onChange: (p0) {
          context.read<MainProvider>().search();
        },
      ),
    );
  }
}
