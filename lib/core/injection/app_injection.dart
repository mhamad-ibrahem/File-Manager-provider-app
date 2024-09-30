import 'package:get_it/get_it.dart';
import '../../features/main/injection/main_injection.dart';
import '../../features/splash/injection/splash_injection.dart';

final sl = GetIt.instance;

Future<void> injection() async {
  //splash
  splashInjection();
  //main
  mainInjection();
}
