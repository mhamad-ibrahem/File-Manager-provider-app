import 'package:flutter/material.dart';

import '../../common/colors/app_colors.dart';

AppColors appColors = AppColors();
TextStyle displaySmallDark() {
  return TextStyle(
    color: appColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

TextStyle displayMediumDark() {
  return TextStyle(
      color: appColors.white, fontSize: 16, fontWeight: FontWeight.w500);
}

TextStyle displayLargeDark() {
  return TextStyle(
    color: appColors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
