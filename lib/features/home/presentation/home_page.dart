import 'package:flutter/material.dart';

import '../../../app/app_scroll_controller.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_gradients.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_nav_bar_delegate.dart';
import '../../../core/widgets/gradient_text.dart';
import '../../../core/widgets/responsive_container.dart';
import '../../../core/widgets/tech_chip.dart';
import 'widgets/about_summary_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const Positioned.fill(
            child: ColoredBox(
              color: AppColors.background,
            ),
          ),

          const _HeroBackgroundImage(),

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

          CustomScrollView(
            controller: AppScrollController.scrollController,
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: AppNavBarDelegate(context: context),
              ),
              const SliverToBoxAdapter(
                child: _HeroContent(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return ResponsiveContainer(
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
            child: const _HeroTextBlock(),
          ),
          const AboutSummaryCard(),
          const SizedBox(height: 10),
          const _TechStack(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _HeroTextBlock extends StatelessWidget {
  const _HeroTextBlock();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final textWidth = ResponsiveHelper.heroTextWidth(context);

    return SizedBox(
      width: textWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '// Hola, soy',
            style: AppTextStyles.heroPrefix.copyWith(
              fontSize: ResponsiveHelper.heroPrefixSize(context),
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: GradientText(
              text: AppStrings.displayName,
              gradient: AppGradients.nameGradient,
              style: AppTextStyles.heroName.copyWith(
                fontSize: ResponsiveHelper.heroNameSize(context),
              ),
            ),
          ),
          const SizedBox(height: 14),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              '[ ${AppStrings.role} ]',
              style: AppTextStyles.heroRole.copyWith(
                fontSize: ResponsiveHelper.heroRoleSize(context),
                letterSpacing: isMobile ? 2.4 : 3.5,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            AppStrings.heroDescription,
            style: AppTextStyles.heroBody.copyWith(
              fontSize: ResponsiveHelper.heroBodySize(context),
              height: isMobile ? 1.5 : 1.55,
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 16,
            runSpacing: 14,
            children: [
              AppButton(
                text: 'Proyectos',
                icon: Icons.arrow_forward_rounded,
                width: isMobile ? 138 : 160,
                onPressed: () => AppScrollController.scrollTo(
                  AppScrollController.projectsKey,
                ),
              ),
              AppButton(
                text: 'CV',
                icon: Icons.download_rounded,
                width: isMobile ? 118 : 145,
                variant: AppButtonVariant.outline,
                onPressed: () {},
              ),
              AppButton(
                text: 'Contacto',
                icon: Icons.mail_outline_rounded,
                width: isMobile ? 138 : 160,
                variant: AppButtonVariant.outline,
                onPressed: () => AppScrollController.scrollTo(
                  AppScrollController.contactKey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TechStack extends StatelessWidget {
  const _TechStack();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 12,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: const [
          TechChip(
            label: 'Flutter',
            iconPath: AppAssets.flutterIcon,
          ),
          TechChip(
            label: 'Firebase',
            iconPath: AppAssets.firebaseIcon,
          ),
          TechChip(
            label: 'Kotlin',
            iconPath: AppAssets.kotlinIcon,
          ),
          TechChip(
            label: 'Java',
            iconPath: AppAssets.javaIcon,
          ),
          TechChip(
            label: 'SQL',
            iconPath: AppAssets.databaseIcon,
          ),
          TechChip(
            label: 'Spring Boot',
            iconPath: AppAssets.springBootIcon,
          ),
        ],
      ),
    );
  }
}

class _HeroBackgroundImage extends StatelessWidget {
  const _HeroBackgroundImage();

  @override
  Widget build(BuildContext context) {
    final screenWidth = ResponsiveHelper.width(context);
    final screenHeight = ResponsiveHelper.height(context);

    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    final imageWidth = isMobile
        ? screenWidth * 1.25
        : isTablet
        ? screenWidth * 0.95
        : screenWidth * 0.82;

    final imageHeight = isMobile
        ? screenHeight * 0.78
        : isTablet
        ? screenHeight * 0.76
        : screenHeight * 0.86;

    return Positioned(
      top: isMobile ? 70 : 35,
      right: isMobile ? -180 : 100,
      child: IgnorePointer(
        child: SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: Image.asset(
            AppAssets.heroBackground,
            fit: BoxFit.contain,
            alignment: Alignment.topRight,
          ),
        ),
      ),
    );
  }
}