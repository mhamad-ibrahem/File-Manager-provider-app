import '../../features/splash/data/model/local_user_data_model.dart';
import '../local_storage/get_storage.dart';

class AppServices {
  static String token = '';
  static LocalUserData? localUserData;
  Future<AppServices> init() async {
    await LocalStorageService.init();
    return this;
  }
}

initialServices() async {
  await AppServices().init();
}
