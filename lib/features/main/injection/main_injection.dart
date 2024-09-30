


import '../../../core/injection/app_injection.dart';
import '../presentation/provider/main_provider.dart';


Future<void> mainInjection() async {
//! Feature - splash

// provider
  sl.registerFactory(() => MainProvider());

}
