import 'dart:io';

import 'package:file_manger_app/core/helpers/log_helper/log_helper.dart';
import 'package:flutter/material.dart';
import '../../../../../core/routes/route_export.dart';
import '../../../../../shared/widgets/toast/cherry_toast.dart';

mixin CreateFolderProvider on ChangeNotifier {
  createFolder({
    required String path,
    required BuildContext context,
    required VoidCallback voidCallback,
    required TextEditingController name,
  }) async {
    try {
      LogHelper.logCyan("name is ${name.text} path is $path");
      final dir = Directory("$path/${name.text}");
      dir.createSync();
      Navigator.pop(context);
      voidCallback();
      AppCherryToast.showSuccessToast(
          message: 'Created successfully', context: context);
      name.clear();
    } catch (e) {
      LogHelper.logError('error is $e');
    }
  }
}
