import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app/app_scroll_controller.dart';
import '../constants/app_assets.dart';
import '../constants/app_links.dart';
import '../constants/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_text_styles.dart';
import '../utils/launch_url_helper.dart';
import '../utils/responsive_helper.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = ResponsiveHelper.width(context);
    final navHeight = ResponsiveHelper.navHeight(context);

    final bool isVerySmall = width < 760;
    final bool isIntermediate = width >= 760 && width < 1180;

    return Container(
      height: navHeight,
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding(width),
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.94),
        border: Border(
          bottom: BorderSide(
            color: AppColors.white.withValues(alpha: 0.10),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.logoYr,
            width: _logoWidth(width),
            height: _logoHeight(width),
            fit: BoxFit.contain,
          ),
          SizedBox(width: _logoNameSpacing(width)),
          SizedBox(
            width: _nameBoxWidth(width),
            child: Text(
              width < 520 ? 'Yolanda Rabal' : AppStrings.fullName,
              style: AppTextStyles.navName.copyWith(
                fontSize: _nameFontSize(width),
                letterSpacing: _nameLetterSpacing(width),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 18),
          const Spacer(),
          if (isVerySmall)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _SocialIcon(
                  icon: FontAwesomeIcons.github,
                  onTap: () => LaunchUrlHelper.open(AppLinks.github),
                  compact: true,
                ),
                const SizedBox(width: 10),
                _SocialIcon(
                  icon: FontAwesomeIcons.linkedin,
                  onTap: () => LaunchUrlHelper.open(AppLinks.linkedIn),
                  compact: true,
                ),
              ],
            )
          else
            Flexible(
              flex: 3,
              child: ValueListenableBuilder<String?>(
                valueListenable: AppScrollController.activeSection,
                builder: (context, activeSection, _) {
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _NavItem(
                          text: 'Proyectos',
                          section: AppScrollController.projectsSection,
                          isActive: activeSection ==
                              AppScrollController.projectsSection,
                          fontSize: _navFontSize(width),
                          spacing: _navSpacing(width),
                        ),
                        _NavItem(
                          text: 'Educación',
                          section: AppScrollController.educationSection,
                          isActive: activeSection ==
                              AppScrollController.educationSection,
                          fontSize: _navFontSize(width),
                          spacing: _navSpacing(width),
                        ),
                        _NavItem(
                          text: 'Certificados',
                          section: AppScrollController.certificatesSection,
                          isActive: activeSection ==
                              AppScrollController.certificatesSection,
                          fontSize: _navFontSize(width),
                          spacing: _navSpacing(width),
                        ),

                        _NavItem(
                          text: 'Contacto',
                          section: AppScrollController.contactSection,
                          isActive: activeSection ==
                              AppScrollController.contactSection,
                          fontSize: _navFontSize(width),
                          spacing: _navSpacing(width),
                        ),
                        SizedBox(width: _socialSpacing(width)),
                        _SocialIcon(
                          icon: FontAwesomeIcons.github,
                          onTap: () => LaunchUrlHelper.open(AppLinks.github),
                          compact: isIntermediate,
                        ),
                        SizedBox(width: isIntermediate ? 10 : 14),
                        _SocialIcon(
                          icon: FontAwesomeIcons.linkedin,
                          onTap: () => LaunchUrlHelper.open(AppLinks.linkedIn),
                          compact: isIntermediate,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  static double _horizontalPadding(double width) {
    if (width < 430) return 20;
    if (width < 600) return 24;
    if (width < 900) return 32;
    if (width < 1180) return 42;
    if (width < 1400) return 58;
    return 78;
  }

  static double _logoWidth(double width) {
    if (width < 600) return 48;
    if (width < 1180) return 52;
    return 58;
  }

  static double _logoHeight(double width) {
    if (width < 600) return 38;
    return 42;
  }

  static double _logoNameSpacing(double width) {
    if (width < 600) return 14;
    if (width < 1180) return 16;
    return 24;
  }

  static double _nameBoxWidth(double width) {
    if (width < 520) return 150;
    if (width < 760) return 190;
    if (width < 900) return 230;
    if (width < 1180) return 270;
    if (width < 1400) return 310;
    return 360;
  }

  static double _nameFontSize(double width) {
    if (width < 430) return 13;
    if (width < 600) return 14;
    if (width < 900) return 14.5;
    if (width < 1180) return 15;
    return 16;
  }

  static double _nameLetterSpacing(double width) {
    if (width < 600) return 1.1;
    if (width < 1180) return 1.6;
    if (width < 1400) return 2;
    return 2.4;
  }

  static double _navFontSize(double width) {
    if (width < 900) return 13.5;
    if (width < 1180) return 14;
    return 15;
  }

  static double _navSpacing(double width) {
    if (width < 900) return 22;
    if (width < 1180) return 26;
    if (width < 1400) return 34;
    return 42;
  }

  static double _socialSpacing(double width) {
    if (width < 1180) return 24;
    return 34;
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.text,
    required this.section,
    required this.fontSize,
    required this.spacing,
    required this.isActive,
  });

  final String text;
  final String section;
  final double fontSize;
  final double spacing;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final onTap = _getOnTap();

    return Padding(
      padding: EdgeInsets.only(left: spacing),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: AppTextStyles.navItem.copyWith(
                  fontSize: fontSize,
                  color: isActive
                      ? AppColors.textPrimary
                      : AppColors.textPrimary.withValues(alpha: 0.92),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 7),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: isActive ? 78 : 0,
                height: 3,
                decoration: BoxDecoration(
                  gradient: AppGradients.underlineGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  VoidCallback _getOnTap() {
    switch (section) {
      case AppScrollController.projectsSection:
        return () => AppScrollController.scrollTo(
          AppScrollController.projectsKey,
          section: AppScrollController.projectsSection,
        );

      case AppScrollController.educationSection:
        return () => AppScrollController.scrollTo(
          AppScrollController.educationKey,
          section: AppScrollController.educationSection,
        );

      case AppScrollController.certificatesSection:
        return () => AppScrollController.scrollTo(
          AppScrollController.certificatesKey,
          section: AppScrollController.certificatesSection,
        );

      case AppScrollController.contactSection:
        return () => AppScrollController.scrollTo(
          AppScrollController.contactKey,
          section: AppScrollController.contactSection,
        );

      default:
        return () {};
    }
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({
    required this.icon,
    required this.onTap,
    this.compact = false,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: compact ? 40 : 44,
      height: compact ? 40 : 44,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: FaIcon(
          icon,
          size: compact ? 18 : 20,
        ),
        color: AppColors.textPrimary,
        padding: EdgeInsets.zero,
      ),
    );
  }
}