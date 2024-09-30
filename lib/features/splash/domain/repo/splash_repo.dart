import '../../data/model/local_user_data_model.dart';

abstract class SplashRepo {
  Future<LocalUserData?> getLocalUserData();
}
