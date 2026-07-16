import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'study_chip.dart';
import 'timeline_dot.dart';

class EducationTimelineItem extends StatelessWidget {
  const EducationTimelineItem({
    super.key,
    required this.period,
    required this.title,
    required this.institution,
    required this.description,
    required this.chips,
    required this.isLast,
  });

  final String period;
  final String title;
  final String institution;
  final String description;
  final List<String> chips;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    if (isMobile) {
      return _MobileTimelineItem(
        period: period,
        title: title,
        institution: institution,
        description: description,
        chips: chips,
        isLast: isLast,
      );
    }

    return _DesktopTimelineItem(
      period: period,
      title: title,
      institution: institution,
      description: description,
      chips: chips,
      isLast: isLast,
    );
  }
}

class _DesktopTimelineItem extends StatelessWidget {
  const _DesktopTimelineItem({
    required this.period,
    required this.title,
    required this.institution,
    required this.description,
    required this.chips,
    required this.isLast,
  });

  final String period;
  final String title;
  final String institution;
  final String description;
  final List<String> chips;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 142,
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                period,
                style: AppTextStyles.heroRole.copyWith(
                  fontSize: 13,
                  letterSpacing: 1.6,
                  color: AppColors.magenta,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 54,
            child: Column(
              children: [
                const TimelineDot(),
                Expanded(
                  child: Container(
                    width: 1,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: isLast
                        ? Colors.transparent
                        : AppColors.cyan.withValues(alpha: 0.24),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: isLast ? 0 : 58,
              ),
              child: _TimelineContent(
                period: period,
                title: title,
                institution: institution,
                description: description,
                chips: chips,
                showPeriodInsideCard: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileTimelineItem extends StatelessWidget {
  const _MobileTimelineItem({
    required this.period,
    required this.title,
    required this.institution,
    required this.description,
    required this.chips,
    required this.isLast,
  });

  final String period;
  final String title;
  final String institution;
  final String description;
  final List<String> chips;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: isLast ? 0 : 46,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
              child: Column(
                children: [
                  const TimelineDot(),
                  Expanded(
                    child: Container(
                      width: 1,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: isLast
                          ? Colors.transparent
                          : AppColors.cyan.withValues(alpha: 0.24),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _TimelineContent(
                period: period,
                title: title,
                institution: institution,
                description: description,
                chips: chips,
                showPeriodInsideCard: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelineContent extends StatelessWidget {
  const _TimelineContent({
    required this.period,
    required this.title,
    required this.institution,
    required this.description,
    required this.chips,
    required this.showPeriodInsideCard,
  });

  final String period;
  final String title;
  final String institution;
  final String description;
  final List<String> chips;
  final bool showPeriodInsideCard;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.68),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.cyan.withValues(alpha: 0.18),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.06),
            blurRadius: 22,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: AppColors.magenta.withValues(alpha: 0.045),
            blurRadius: 26,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showPeriodInsideCard) ...[
            Text(
              period,
              style: AppTextStyles.heroRole.copyWith(
                fontSize: 12,
                letterSpacing: 1.4,
                color: AppColors.magenta,
              ),
            ),
            const SizedBox(height: 14),
          ],
          Text(
            title,
            style: AppTextStyles.cardTitle.copyWith(
              fontSize: isMobile ? 23 : 24,
              height: 1.18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            institution,
            style: AppTextStyles.heroRole.copyWith(
              fontSize: isMobile ? 12.5 : 13.5,
              letterSpacing: 1.35,
              color: AppColors.cyan,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            description,
            style: AppTextStyles.body.copyWith(
              fontSize: isMobile ? 14.5 : 14.5,
              height: 1.56,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: chips
                .map(
                  (chip) => StudyChip(label: chip),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}