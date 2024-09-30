import 'package:flutter/material.dart';

class AppSize {
  static const double kTabletMaxWidth = 760.0;
  static const double mobilWidth = 500.0;
  static double screenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  static const double appCustomRadius = 16;

  static bool isTabletScreen({required BuildContext context}) {
    return MediaQuery.of(context).size.width >= mobilWidth;
  }
}
