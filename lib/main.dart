import 'package:file_manger_app/core/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/injection/app_injection.dart' as di;
import 'core/common/colors/app_colors.dart';
import 'core/routes/app_router.dart';
import 'core/routes/constant/app_routes.dart';
import 'core/services/app_services.dart';
import 'core/theme/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors().black));
  await di.injection();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider()..getCurrentThemeMode(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeProvider.isDarkMode
                  ? AppTheme.darkTheme
                  : AppTheme.lightsTheme,
              routes: AppRouter.routes,
              initialRoute: AppRoutes.splashScreen,
            );
          });
        },
      ),
    );
  }
}
