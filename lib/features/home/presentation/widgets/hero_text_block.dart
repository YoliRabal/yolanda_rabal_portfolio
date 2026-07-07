import 'package:flutter/material.dart';

import '../../../../app/app_scroll_controller.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/download_helper.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/gradient_text.dart';

class HeroTextBlock extends StatelessWidget {
  const HeroTextBlock({super.key});

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
                onPressed: DownloadHelper.downloadCv,
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