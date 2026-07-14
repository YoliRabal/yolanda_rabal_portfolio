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
                title: title,
                institution: institution,
                description: description,
                chips: chips,
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
    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 0 : 52,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 34,
                child: Center(
                  child: TimelineDot(),
                ),
              ),
              const SizedBox(width: 14),
              Text(
                period,
                style: AppTextStyles.heroRole.copyWith(
                  fontSize: 12,
                  letterSpacing: 1.4,
                  color: AppColors.magenta,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 34,
                  child: Center(
                    child: Container(
                      width: 1,
                      color: isLast
                          ? Colors.transparent
                          : AppColors.cyan.withValues(alpha: 0.24),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _TimelineContent(
                    title: title,
                    institution: institution,
                    description: description,
                    chips: chips,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineContent extends StatelessWidget {
  const _TimelineContent({
    required this.title,
    required this.institution,
    required this.description,
    required this.chips,
  });

  final String title;
  final String institution;
  final String description;
  final List<String> chips;

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
          Text(
            title,
            style: AppTextStyles.cardTitle.copyWith(
              fontSize: isMobile ? 24 : 24,
              height: 1.18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            institution,
            style: AppTextStyles.heroRole.copyWith(
              fontSize: isMobile ? 13 : 13.5,
              letterSpacing: 1.4,
              color: AppColors.cyan,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            description,
            style: AppTextStyles.body.copyWith(
              fontSize: isMobile ? 15 : 14.5,
              height: 1.58,
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