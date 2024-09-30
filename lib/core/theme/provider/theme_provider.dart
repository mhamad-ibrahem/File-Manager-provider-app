import 'package:file_manger_app/core/helpers/log_helper/log_helper.dart';
import 'package:file_manger_app/core/local_storage/local_storage_box/local_storage_box.dart';
import 'package:flutter/material.dart';

import '../../local_storage/get_storage.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  LocalStorageService localStorageService = LocalStorageService();
  getCurrentThemeMode() {
    isDarkMode = localStorageService.getBool(LocalStorageBox.isDarkTheme);
    ChangeNotifier();
  }

  changeTheme() {
    isDarkMode = !isDarkMode;
    LogHelper.logSuccess('isDarkMode $isDarkMode');
     notifyListeners();
    localStorageService.setBool(
        key: LocalStorageBox.isDarkTheme, value: isDarkMode);
   
  }
}
