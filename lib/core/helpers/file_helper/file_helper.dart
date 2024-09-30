import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// import '../../../../shared/widgets/pop_up/cherry_toast.dart';

class FileHelper {
  static Future<File?> pickFile(
    context,
  ) async {
    File? uploadedImage;
    FilePickerResult? res =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (res != null) {
      PlatformFile file = res.files.first;
      uploadedImage = File(file.path!);
      debugPrint('uploadedImage is : $uploadedImage');
    } else {
      // AppCherryToast.showErrorToast(
      //   errorMessage: "Failed to pick image",
      // );
    }

    return uploadedImage;
  }
}
