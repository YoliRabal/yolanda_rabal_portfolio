import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_shadows.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.borderColor = AppColors.borderGlow,
    this.withGlow = true,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final bool withGlow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: borderColor.withValues(alpha: 0.75),
          width: 1,
        ),
        boxShadow: withGlow ? AppShadows.softShadow : null,
      ),
      child: child,
    );
  }
}