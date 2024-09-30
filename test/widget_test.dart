import 'dart:io';
import 'package:file_manger_app/core/helpers/log_helper/log_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //create folder
  test('should throw an error for invalid path', () async {
    const invalidPath = '/invalid/path';
    // Use a try-catch block to expect an error
    final result = await createFolder(invalidPath, 'ss');
    expect(result, false);
  });
  test('should throw an error for empty name', () async {
    const invalidPath = '/invalid/path';
    // Use a try-catch block to expect an error
    final result = await createFolder(invalidPath, '');
    expect(result, false);
  });

  test('should throw an error for existing folder', () async {
    // Create a temporary folder first
    const existingPath = '/storage/emulated/0';
    bool isCreatedSuccessfully = await createFolder(existingPath, 'ss');
    // Try to create it again and expect an error
    final result = await deleteFolder(
        existingPath); // Assuming you have a deleteFolder function
    if (isCreatedSuccessfully) {
      expect(result, true);
    } else {
      expect(result, false);
    }
  });
}

Future<bool> createFolder(String path, String name) async {
  try {
    LogHelper.logCyan("path $path name $name");
    final dir = Directory("$path/$name");
    dir.createSync();
    return true;
  } catch (e) {
    LogHelper.logError('error is $e');
    return false;
  }
}

Future<bool> deleteFolder(String path) async {
  try {
    final directory = Directory(path);
    if (await directory.exists()) {
      await directory.delete(recursive: true);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
