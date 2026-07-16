import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';

enum ProjectMediaType {
  mobile,
  desktop,
}

class ProjectMediaPlaceholder extends StatelessWidget {
  const ProjectMediaPlaceholder({
    super.key,
    required this.title,
    required this.type,
  });

  final String title;
  final ProjectMediaType type;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ProjectMediaType.mobile => const _MobilePlaceholder(),
      ProjectMediaType.desktop => const _DesktopPlaceholder(),
    };
  }
}

class _DesktopPlaceholder extends StatelessWidget {
  const _DesktopPlaceholder();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF020611),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.cyan.withValues(alpha: 0.22),
          width: 1,
        ),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cyan.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.08),
              width: 1,
            ),
          ),
          child: Center(
            child: _PlaceholderLabel(
              icon: Icons.desktop_windows_rounded,
              text: isMobile
                  ? 'Captura próximamente'
                  : 'Captura horizontal próximamente',
            ),
          ),
        ),
      ),
    );
  }
}

class _MobilePlaceholder extends StatelessWidget {
  const _MobilePlaceholder();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Center(
      child: SizedBox(
        height: isMobile ? 280 : 360,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: Offset(isMobile ? -42 : -58, 12),
              child: _PhoneFrame(
                opacity: 0.48,
                width: isMobile ? 118 : 150,
              ),
            ),
            Transform.translate(
              offset: Offset(isMobile ? 42 : 58, -8),
              child: _PhoneFrame(
                opacity: 0.82,
                width: isMobile ? 128 : 160,
              ),
            ),
            Positioned(
              bottom: isMobile ? 10 : 18,
              child: const _PlaceholderLabel(
                icon: Icons.phone_iphone_rounded,
                text: 'Capturas móviles próximamente',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  const _PhoneFrame({
    required this.opacity,
    required this.width,
  });

  final double opacity;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xFF020611),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: AppColors.cyan.withValues(alpha: 0.35),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.cyan.withValues(alpha: 0.08),
              blurRadius: 24,
              spreadRadius: 1,
            ),
          ],
        ),
        child: AspectRatio(
          aspectRatio: 9 / 18.5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cyan.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaceholderLabel extends StatelessWidget {
  const _PlaceholderLabel({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 14,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.86),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: AppColors.magenta.withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.cyan,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: isMobile ? 11.5 : 12.5,
              color: AppColors.textPrimary,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}