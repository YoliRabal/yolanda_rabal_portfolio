import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class TimelineDot extends StatelessWidget {
  const TimelineDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.cyan,
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.65),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white.withValues(alpha: 0.88),
          ),
        ),
      ),
    );
  }
}