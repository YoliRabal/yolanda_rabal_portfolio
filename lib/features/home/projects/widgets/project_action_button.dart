import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/launch_url_helper.dart';

class ProjectActionButton extends StatelessWidget {
  const ProjectActionButton({
    super.key,
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => LaunchUrlHelper.open(url),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            gradient: label == 'Ver código' ? null : const LinearGradient(
              colors: [
                AppColors.magenta,
                AppColors.blue,
                AppColors.cyan,
              ],
            ),
            color: label == 'Ver código'
                ? AppColors.background.withValues(alpha: 0.82)
                : null,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: label == 'Ver código'
                  ? AppColors.cyan.withValues(alpha: 0.55)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: AppColors.textPrimary,
              ),
              const SizedBox(width: 9),
              Text(
                label,
                style: AppTextStyles.button.copyWith(
                  fontSize: 13.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}