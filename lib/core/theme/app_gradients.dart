import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  const AppGradients._();

  static const LinearGradient nameGradient = LinearGradient(
    colors: [
      AppColors.magenta,
      AppColors.purple,
      AppColors.blue,
      AppColors.cyan,
    ],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      AppColors.purple,
      AppColors.blue,
    ],
  );

  static const LinearGradient underlineGradient = LinearGradient(
    colors: [
      AppColors.magenta,
      AppColors.cyan,
    ],
  );
}