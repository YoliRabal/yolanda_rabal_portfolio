import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_shadows.dart';
import '../theme/app_text_styles.dart';

enum AppButtonVariant {
  primary,
  outline,
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.variant = AppButtonVariant.primary,
    this.width = 178,
  });

  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final AppButtonVariant variant;
  final double width;

  bool get isPrimary => variant == AppButtonVariant.primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isPrimary ? AppGradients.buttonGradient : null,
          color: isPrimary ? null : AppColors.background.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isPrimary
                ? Colors.transparent
                : AppColors.cyan.withValues(alpha: 0.9),
            width: 1,
          ),
          boxShadow: isPrimary ? AppShadows.purpleGlow : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text, style: AppTextStyles.button),
                if (icon != null) ...[
                  const SizedBox(width: 14),
                  Icon(icon, color: AppColors.textPrimary, size: 22),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}