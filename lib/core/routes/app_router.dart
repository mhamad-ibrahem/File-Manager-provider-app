


import 'package:file_manger_app/features/splash/presentation/view/pages/splash_page.dart';

import '../../features/main/presentation/view/pages/main_page.dart';
import 'route_export.dart';

class AppRouter {
 static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.splashScreen: (context) => const SplashPage(),
     AppRoutes().mainRoute: (context) => const MainPage(),
  };
}
