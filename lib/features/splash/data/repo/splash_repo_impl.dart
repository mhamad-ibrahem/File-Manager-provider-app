import 'dart:convert';
import '../../../../core/local_storage/get_storage.dart';
import '../../domain/repo/splash_repo.dart';
import '../model/local_user_data_model.dart';

class SplashRepoImpl extends SplashRepo {
 final LocalStorageService localStorageService = LocalStorageService();

  @override
  Future<LocalUserData?> getLocalUserData() async {
    final localJson =
        localStorageService.getString('');
    if (localJson.isNotEmpty) {
      var decodeJsonData = json.decode(localJson);
      LocalUserData jsonData = LocalUserData.fromJson(decodeJsonData);
      return Future.value(jsonData);
    } else {
      return null;
    }
  }
}
