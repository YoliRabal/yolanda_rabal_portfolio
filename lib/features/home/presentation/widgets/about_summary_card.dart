import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';

class AboutSummaryCard extends StatelessWidget {
  const AboutSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Container(
      padding: EdgeInsets.all(isDesktop ? 18 : 20),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.62),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.magenta.withValues(alpha: 0.75),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.magenta.withValues(alpha: 0.22),
            blurRadius: 26,
            spreadRadius: 1,
          ),
        ],
      ),
      child: isDesktop ? const _DesktopLayout() : const _CompactLayout(),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ProfileImage(size: 165),
        const SizedBox(width: 28),
        const Expanded(
          flex: 3,
          child: _AboutText(),
        ),
        Container(
          width: 1,
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          color: AppColors.white.withValues(alpha: 0.16),
        ),
        const Expanded(
          flex: 4,
          child: _ContributionBlock(),
        ),
      ],
    );
  }
}

class _CompactLayout extends StatelessWidget {
  const _CompactLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ProfileImage(size: 150),
        const SizedBox(height: 22),
        const _AboutText(),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.white.withValues(alpha: 0.16),
        ),
        const SizedBox(height: 24),
        const _ContributionBlock(),
      ],
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.cyan,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.35),
            blurRadius: 22,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          AppAssets.profileYolanda,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.aboutTitle,
          style: AppTextStyles.sectionTitle,
        ),
        const SizedBox(height: 12),
        Text(
          AppStrings.aboutDescription,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: isDesktop ? 12.3 : 13.5,
            height: isDesktop ? 1.42 : 1.5,
          ),
        ),
      ],
    );
  }
}

class _ContributionBlock extends StatelessWidget {
  const _ContributionBlock();

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.contributionTitle,
          style: AppTextStyles.sectionTitle,
        ),
        const SizedBox(height: 18),
        isDesktop
            ? const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _ContributionItem(
                icon: Icons.code_rounded,
                title: AppStrings.focusTitle,
                text: AppStrings.focusText,
                color: AppColors.magenta,
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              child: _ContributionItem(
                icon: Icons.lightbulb_outline_rounded,
                title: AppStrings.mindsetTitle,
                text: AppStrings.mindsetText,
                color: AppColors.cyan,
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              child: _ContributionItem(
                icon: Icons.star_border_rounded,
                title: AppStrings.differentialTitle,
                text: AppStrings.differentialText,
                color: AppColors.magenta,
              ),
            ),
          ],
        )
            : const Column(
          children: [
            _ContributionItem(
              icon: Icons.code_rounded,
              title: AppStrings.focusTitle,
              text: AppStrings.focusText,
              color: AppColors.magenta,
            ),
            SizedBox(height: 20),
            _ContributionItem(
              icon: Icons.lightbulb_outline_rounded,
              title: AppStrings.mindsetTitle,
              text: AppStrings.mindsetText,
              color: AppColors.cyan,
            ),
            SizedBox(height: 20),
            _ContributionItem(
              icon: Icons.star_border_rounded,
              title: AppStrings.differentialTitle,
              text: AppStrings.differentialText,
              color: AppColors.magenta,
            ),
          ],
        ),
      ],
    );
  }
}

class _ContributionItem extends StatelessWidget {
  const _ContributionItem({
    required this.icon,
    required this.title,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: isDesktop ? 44 : 50,
          height: isDesktop ? 44 : 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: isDesktop ? 22 : 26,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.cardTitle.copyWith(
                  color: color,
                  fontSize: isDesktop ? 13.5 : 14.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                text,
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: isDesktop ? 12 : 12.8,
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