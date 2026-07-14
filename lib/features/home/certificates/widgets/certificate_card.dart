import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/launch_url_helper.dart';
import '../../../../core/utils/responsive_helper.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.institution,
    required this.date,
    required this.description,
    this.verificationUrl,
    this.clipImageAsCircle = true,
  });

  final String imagePath;
  final String title;
  final String institution;
  final String date;
  final String description;
  final String? verificationUrl;
  final bool clipImageAsCircle;

  bool get _hasVerification => verificationUrl != null;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 24,
        vertical: isMobile ? 22 : 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.76),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.cyan.withValues(alpha: 0.18),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.055),
            blurRadius: 22,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: AppColors.magenta.withValues(alpha: 0.04),
            blurRadius: 28,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _CertificateImage(
            imagePath: imagePath,
            clipAsCircle: clipImageAsCircle,
          ),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.cardTitle.copyWith(
              fontSize: isMobile ? 18.5 : 20,
              height: 1.18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            institution,
            textAlign: TextAlign.center,
            style: AppTextStyles.heroRole.copyWith(
              fontSize: isMobile ? 11.8 : 12.5,
              letterSpacing: 1.15,
              color: AppColors.cyan,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            date,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 12.5,
              color: AppColors.magenta,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              fontSize: isMobile ? 13.2 : 13.7,
              height: 1.45,
              color: AppColors.textSecondary,
            ),
          ),
          const Spacer(),
          if (_hasVerification) ...[
            const SizedBox(height: 14),
            _VerificationButton(
              url: verificationUrl!,
            ),
          ],
        ],
      ),
    );
  }
}

class _CertificateImage extends StatelessWidget {
  const _CertificateImage({
    required this.imagePath,
    required this.clipAsCircle,
  });

  final String imagePath;
  final bool clipAsCircle;

  @override
  Widget build(BuildContext context) {
    final Widget image = Image.asset(
      imagePath,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
    );

    return SizedBox(
      width: 86,
      height: 86,
      child: clipAsCircle
          ? ClipOval(
        child: image,
      )
          : Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white.withValues(alpha: 0.96),
          boxShadow: [
            BoxShadow(
              color: AppColors.magenta.withValues(alpha: 0.14),
              blurRadius: 22,
              spreadRadius: 1,
            ),
          ],
        ),
        child: image,
      ),
    );
  }
}

class _VerificationButton extends StatelessWidget {
  const _VerificationButton({
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => LaunchUrlHelper.open(url),
        borderRadius: BorderRadius.circular(999),
        child: Container(
          height: 31,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: AppColors.cyan.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: AppColors.cyan.withValues(alpha: 0.45),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.verified_outlined,
                size: 15,
                color: AppColors.cyan,
              ),
              const SizedBox(width: 7),
              Text(
                'Ver credencial',
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 12.3,
                  height: 1,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}