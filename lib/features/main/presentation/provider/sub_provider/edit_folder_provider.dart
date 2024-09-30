import 'dart:io';

import 'package:file_manger_app/core/helpers/log_helper/log_helper.dart';

import '../../../../../core/routes/route_export.dart';
import '../../../../../shared/widgets/toast/cherry_toast.dart';

mixin EditFolderProvider on ChangeNotifier {
  editFolderOrFile({
    required BuildContext context,
    required String dirPath,
    required String oldDirPath,
    required VoidCallback voidCallback,
    required bool isFile,
  }) {
    LogHelper.logCyan("oldDirPath $oldDirPath  dirPath $dirPath");
    if (isFile) {
      final file = File(oldDirPath);
      file.renameSync(dirPath);
    } else {
      final dir = Directory(oldDirPath);
      dir.renameSync(dirPath);
    }

    notifyListeners();
    voidCallback();
    Navigator.of(context).pop();
    AppCherryToast.showSuccessToast(
        message: 'Updated successfully', context: context);
  }
}
