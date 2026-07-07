import 'package:flutter/material.dart';

import '../../../app/app_scroll_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/responsive_container.dart';
import 'widgets/about_summary_card.dart';
import 'widgets/hero_background_image.dart';
import 'widgets/hero_text_block.dart';
import 'widgets/tech_stack.dart';

class PresentationSection extends StatelessWidget {
  const PresentationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Stack(
      children: [
        const Positioned.fill(
          child: ColoredBox(
            color: AppColors.background,
          ),
        ),

        const HeroBackgroundImage(),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.background,
                  AppColors.background.withValues(alpha: 0.55),
                  AppColors.background.withValues(alpha: 0.1),
                ],
                stops: const [0.0, 0.42, 1.0],
              ),
            ),
          ),
        ),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  AppColors.background.withValues(alpha: 0.42),
                  AppColors.background,
                ],
                stops: const [0.0, 0.68, 0.88, 1.0],
              ),
            ),
          ),
        ),

        ResponsiveContainer(
          maxWidth: 1500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                key: AppScrollController.homeKey,
                padding: EdgeInsets.only(
                  top: ResponsiveHelper.heroTopPadding(context),
                  bottom: isMobile ? 18 : 20,
                ),
                child: const HeroTextBlock(),
              ),
              const AboutSummaryCard(),
              const SizedBox(height: 10),
              const TechStack(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}