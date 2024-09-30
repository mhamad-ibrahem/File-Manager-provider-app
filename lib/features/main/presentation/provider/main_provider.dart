
import 'package:file_manger_app/core/config/classes/status_request.dart';
import 'package:file_manger_app/core/helpers/log_helper/log_helper.dart';
import 'package:file_manger_app/shared/widgets/toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'sub_provider/create_folder_provider.dart';
import 'sub_provider/delete_folder_provider.dart';
import 'sub_provider/edit_folder_provider.dart';
import 'sub_provider/get_folder_provider.dart';
import 'sub_provider/sort_and_filter_folders_provider.dart';

class MainProvider extends ChangeNotifier
    with
        CreateFolderProvider,
        DeleteFolderProvider,
        EditFolderProvider,
        GetFolderProvider,
        SortAndFilterFolderProvider {
  StatusRequest statusRequest = StatusRequest.none;
  final TextEditingController name = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String oldDirPath = '';
 
  requestFilePermission(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    notifyListeners();
    try {
      var status = await Permission.storage.request();
      var status2 = await Permission.accessMediaLocation.request();
      var status3 = await Permission.manageExternalStorage.request();
      if (status.isDenied || status2.isDenied || status3.isDenied) {
        LogHelper.logError("status isDenied");
        statusRequest = StatusRequest.failure;
        AppCherryToast.showErrorToast(context:context ,errorMessage: 'Permission denied');
        notifyListeners();
      } else {
        statusRequest = StatusRequest.none;
        getData();
        notifyListeners();
      }
    } catch (e) {
      LogHelper.logError("catch error is $e");
      statusRequest = StatusRequest.failure;
      notifyListeners();
    }
  }

  initName(String value) {
    name.text = value;
    oldDirPath = value;
    LogHelper.logSuccess("name is ${name.text}");
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }
}
