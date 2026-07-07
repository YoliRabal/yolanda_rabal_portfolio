import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/responsive_helper.dart';

class TechChip extends StatelessWidget {
  const TechChip({
    super.key,
    required this.label,
    required this.iconPath,
  });

  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: isMobile ? 118 : 140,
        maxWidth: isMobile ? 170 : 185,
      ),
      child: Container(
        height: ResponsiveHelper.chipHeight(context),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 14 : 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.background.withValues(alpha: 0.65),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.cyan.withValues(alpha: 0.85),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: ResponsiveHelper.chipIconSize(context),
              height: ResponsiveHelper.chipIconSize(context),
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.chip.copyWith(
                  fontSize: ResponsiveHelper.chipFontSize(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}