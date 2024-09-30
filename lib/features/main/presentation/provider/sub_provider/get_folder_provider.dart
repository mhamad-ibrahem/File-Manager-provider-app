import 'dart:io';

import 'package:file_manger_app/core/helpers/log_helper/log_helper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/route_export.dart';

mixin GetFolderProvider on ChangeNotifier {
  Directory directory = Directory('/storage/emulated/0');
  int selectedFileIndex = -1;
  List<FileSystemEntity> files = [];
  List<FileSystemEntity> searchFiles = [];
  final TextEditingController searchTextEditingController =
      TextEditingController();
  bool isSearchList = false;
  getData() {
    files = directory.listSync();
    LogHelper.logSuccess("files length is ${files.length}");
    notifyListeners();
  }

  search() {
    if (searchTextEditingController.text.isNotEmpty) {
      searchFiles = files
          .where((e) => e.path
              .toLowerCase()
              .contains(searchTextEditingController.text.toLowerCase()))
          .toList();
      isSearchList=true;
      LogHelper.logSuccess("files length is ${files.length}");
      notifyListeners();
    } else {
      isSearchList=false;
      getData();
    }
  }

  void onBackPress() {
    if (selectedFileIndex != -1) {
      selectedFileIndex = -1;
      notifyListeners();
      return;
    }
    LogHelper.logCyan("directory path is ${directory.path}");
    if (directory.path != '/storage/emulated/0') {
      directory = directory.parent;
      getData();
    }
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }
}
