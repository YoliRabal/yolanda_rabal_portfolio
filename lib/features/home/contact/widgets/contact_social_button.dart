import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/launch_url_helper.dart';

class ContactSocialButton extends StatelessWidget {
  const ContactSocialButton({
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
        borderRadius: BorderRadius.circular(999),
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.82),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: AppColors.cyan.withValues(alpha: 0.45),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                size: 16,
                color: AppColors.cyan,
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