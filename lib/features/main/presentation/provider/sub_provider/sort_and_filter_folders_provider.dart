import 'dart:io';
import 'package:file_manger_app/core/helpers/log_helper/log_helper.dart';
import 'package:flutter/material.dart';

enum SortOrder { ascending, descending }
enum SortBy { name, date, size }

mixin SortAndFilterFolderProvider on ChangeNotifier {
  SortOrder sortOrder = SortOrder.ascending;
  sortFolderBy({
    required BuildContext context,
    required SortBy sortBy,
    required List<FileSystemEntity> files,
  }) {
    switch (sortBy) {
      case SortBy.name:
        sortFileByName(files: files);
        break;
      case SortBy.date:
        sortFileByDate(files: files);
        break;
      case SortBy.size:
        sortBySize(files: files);
        break;
      default:
    }
    Navigator.pop(context);
  }

  List<FileSystemEntity> filterFiles({
    required List<FileSystemEntity> files,
    required String extensionType,
    required BuildContext context,
  }) {
    List<FileSystemEntity> entities =
        files.where((e) => e.path.endsWith(extensionType)).toList();
    LogHelper.logSuccess("entities length ${entities.length}");
    Navigator.pop(context);
    notifyListeners();
    return entities;
  }

  void sortFileByName({
    required List<FileSystemEntity> files,
  }) {
    if (sortOrder == SortOrder.ascending) {
      files.sort((a, b) {
        return a.path.compareTo(b.path);
      });
    } else {
      files.sort((a, b) {
        return b.path.compareTo(a.path);
      });
    }
    notifyListeners();
  }

  void sortFileByDate({
    required List<FileSystemEntity> files,
  }) {
    if (sortOrder == SortOrder.ascending) {
      files.sort((a, b) {
        if (a is File && b is File) {
          return File(a.path)
              .lastModifiedSync()
              .compareTo(File(b.path).lastModifiedSync());
        } else {
          return a.path.compareTo(b.path);
        }
      });
    } else {
      files.sort((a, b) {
        if (a is File && b is File) {
          return File(b.path)
              .lastModifiedSync()
              .compareTo(File(a.path).lastModifiedSync());
        } else {
          return b.path.compareTo(a.path);
        }
      });
    }
    notifyListeners();
  }

  sortBySize({
    required List<FileSystemEntity> files,
  }) {
    //only comparing files
    if (sortOrder == SortOrder.ascending) {
      files.sort((a, b) {
        if (a is File && b is File) {
          return File(a.path).lengthSync().compareTo(File(b.path).lengthSync());
        } else {
          return a.path.compareTo(b.path);
        }
      });
    } else {
      files.sort((a, b) {
        if (a is File && b is File) {
          return File(b.path).lengthSync().compareTo(File(a.path).lengthSync());
        } else {
          return b.path.compareTo(a.path);
        }
      });
    }
    notifyListeners();
  }
}
