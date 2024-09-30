import 'package:file_manger_app/core/config/classes/status_request.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/log_helper/log_helper.dart';
import '../../../../core/routes/constant/app_routes.dart';
import '../../../../core/services/app_services.dart';
import '../../domain/use_case/get_local_user_data_use_case.dart';

class SplashProvider extends ChangeNotifier {
  final GetUserLocalDataUseCase getUserLocalDataUseCase;

  SplashProvider({required this.getUserLocalDataUseCase});

  StatusRequest statusRequest = StatusRequest.none;

  navigate(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2), () async {
      try {
        AppServices.localUserData = await getUserLocalDataUseCase.execute();
        statusRequest = StatusRequest.none;
        LogHelper.logSuccess("token is :  ${AppServices.localUserData?.token}");
        LogHelper.logMagenta(
            "user id is ${AppServices.localUserData?.id}  user role ${AppServices.localUserData?.type} client id ${AppServices.localUserData?.clientId}");
        Navigator.of(context).popAndPushNamed(AppRoutes().mainRoute);
      } catch (exception) {
        LogHelper.logError("exception is ${exception.toString()}");
        statusRequest = StatusRequest.failure;
        notifyListeners();
      }
    });
  }
}
