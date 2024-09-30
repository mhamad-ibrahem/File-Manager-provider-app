import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/helpers/log_helper/log_helper.dart';
import '../../../../../core/routes/route_export.dart';
import '../../../../../shared/widgets/toast/cherry_toast.dart';

mixin DeleteFolderProvider on ChangeNotifier {
  deleteFolderOrFile({
    required BuildContext context,
    required String dirPath,
    required VoidCallback voidCallback,
  }) {
    LogHelper.logCyan("dirPath $dirPath");
    final dir = Directory(dirPath);
    dir.deleteSync(recursive: true);
    voidCallback();
    notifyListeners();
    AppCherryToast.showSuccessToast(
        message: 'Deleted successfully', context: context);
  }
}
