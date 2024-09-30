import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../core/injection/app_injection.dart' as di;
import '../../../../../shared/widgets/loading/loading_widget.dart';
import '../../../../../shared/widgets/retry_button.dart';
import '../../provider/main_provider.dart';
import '../widgets/files_list.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/main_floating_action_button.dart';
import '../widgets/main_search_field.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // provide the provide for all bottom widgets
      create: (context) => di.sl<MainProvider>()..requestFilePermission(context),
      child: Consumer<MainProvider>(
        builder: (context, mainProvider, child) => PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            mainProvider.onBackPress();
          },
          child: Scaffold(
            floatingActionButton: const MainFloatingActionButton(),
            appBar: mainAppBar(context: context),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<MainProvider>(
                  builder: (context, mainProvider, child) =>
                      mainProvider.statusRequest == StatusRequest.loading
                          ? const Center(child: LoadingWidget())
                          : mainProvider.statusRequest == StatusRequest.failure
                              ? RetryButton(onTap: () {
                                  context
                                      .read<MainProvider>()
                                      .requestFilePermission(context);
                                })
                              : Expanded(
                                  child: Column(
                                    children: [
                                      const MainSearchFieldWidget(),
                                      Expanded(
                                        child: FilesListWidget(
                                          entities: mainProvider.isSearchList
                                              ? mainProvider.searchFiles
                                              : mainProvider.files,
                                          itemCount: mainProvider.isSearchList
                                              ? mainProvider.searchFiles.length
                                              : mainProvider.files.length,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      )
                                    ],
                                  ),
                                ),
                ),
                SizedBox(
                  height: 60.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
