
import '../../../../core/use_cases/no_params_use_case.dart';
import '../../data/model/local_user_data_model.dart';
import '../repo/splash_repo.dart';

class GetUserLocalDataUseCase extends NoParamUseCase<LocalUserData?> {
  final SplashRepo _repo;
  GetUserLocalDataUseCase(this._repo);

  @override
  Future<LocalUserData?> execute() async {
    return await _repo.getLocalUserData();
  }
}
