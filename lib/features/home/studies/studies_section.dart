import 'package:flutter/material.dart';

import '../../../app/app_scroll_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/responsive_container.dart';
import 'widgets/education_timeline.dart';

class StudiesSection extends StatelessWidget {
  const StudiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      key: AppScrollController.educationKey,
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.only(
        top: isMobile ? 40 : 52,
        bottom: isMobile ? 32 : 42,
      ),
      child: ResponsiveContainer(
        maxWidth: 1500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _StudiesHeader(),
            SizedBox(height: isMobile ? 30 : 40),
            const EducationTimeline(),
          ],
        ),
      ),
    );
  }
}

class _StudiesHeader extends StatelessWidget {
  const _StudiesHeader();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '//',
              style: AppTextStyles.heroPrefix.copyWith(
                fontSize: isMobile ? 34 : 42,
                color: AppColors.cyan,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Educación',
              style: AppTextStyles.heroPrefix.copyWith(
                fontSize: isMobile ? 34 : 42,
              ),
            ),
            if (!isMobile) ...[
              const SizedBox(width: 28),
              Expanded(
                child: Container(
                  height: 1,
                  color: AppColors.cyan.withValues(alpha: 0.18),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: isMobile ? double.infinity : 780,
          child: Text(
            'Una trayectoria que combina desarrollo de software, localización digital y control de calidad lingüística.',
            style: AppTextStyles.body.copyWith(
              fontSize: isMobile ? 14.5 : 15.5,
              height: 1.6,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}