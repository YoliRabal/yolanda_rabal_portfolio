import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ContactInfoItem extends StatelessWidget {
  const ContactInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.cyan.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.cyan.withValues(alpha: 0.35),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            size: 22,
            color: AppColors.cyan,
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.heroRole.copyWith(
                  fontSize: 12,
                  letterSpacing: 3,
                  color: AppColors.magenta,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                value,
                style: AppTextStyles.cardTitle.copyWith(
                  fontSize: 16,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}