import 'package:flutter/material.dart';

mixin GradientColors {
  //Gradient colors
  Gradient get brownLinearGradient => const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFFC67C4E),
          Color(0xFFEDAB81),
        ],
      );
}
