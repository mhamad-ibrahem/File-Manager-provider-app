import 'package:file_manger_app/features/splash/presentation/provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/size/app_size.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../shared/widgets/loading/loading_logo.dart';
import '../../../../../core/injection/app_injection.dart' as di;
import '../../../../../shared/widgets/loading/loading_points.dart';
import '../../../../../shared/widgets/retry_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
      body: ChangeNotifierProvider(
        // provide the provide for all bottom widgets
        create: (context) => di.sl<SplashProvider>()..navigate(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedLogo(
              height: AppSize.screenHeight(context: context) * 0.35,
              width: AppSize.screenWidth(context: context),
            ),
            SizedBox(
              height: 20.h,
            ),

            Selector<SplashProvider, StatusRequest>(
                //listen to event only when the value change
                builder: (context, statusRequest, child) =>
                    statusRequest == StatusRequest.loading
                        ? LoadingPoint(
                            size: 20.w,
                          )
                        : statusRequest == StatusRequest.failure
                            ? RetryButton(
                                isWithUpperText: false,
                                colorOfRetryText: AppColors().white,
                                onTap: () {
                                   context.read<SplashProvider>().navigate(context); 
                                })
                            : const SizedBox(),
                selector: (context, splashProvider) =>
                    splashProvider.statusRequest)
          ],
        ),
      ),
    );
  }
}
