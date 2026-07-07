import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppShadows {
  const AppShadows._();

  static List<BoxShadow> purpleGlow = [
    BoxShadow(
      color: AppColors.purple.withValues(alpha: 0.35),
      blurRadius: 24,
      spreadRadius: 1,
    ),
  ];

  static List<BoxShadow> cyanGlow = [
    BoxShadow(
      color: AppColors.cyan.withValues(alpha: 0.30),
      blurRadius: 20,
      spreadRadius: 1,
    ),
  ];

  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.35),
      blurRadius: 30,
      offset: const Offset(0, 12),
    ),
  ];
}