import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app/app_scroll_controller.dart';
import '../../../core/constants/app_links.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/responsive_container.dart';
import 'widgets/contact_form.dart';
import 'widgets/contact_info_item.dart';
import 'widgets/contact_social_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const String email = 'yoli.rabal.adan@gmail.com';

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      key: AppScrollController.contactKey,
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.only(
        top: isMobile ? 34 : 44,
        bottom: isMobile ? 58 : 72,
      ),
      child: ResponsiveContainer(
        maxWidth: 1500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ContactHeader(),
            SizedBox(height: isMobile ? 30 : 40),
            isMobile
                ? const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ContactContent(),
                SizedBox(height: 34),
                ContactForm(),
              ],
            )
                : const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: _ContactContent(),
                ),
                SizedBox(width: 58),
                Expanded(
                  flex: 5,
                  child: ContactForm(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactHeader extends StatelessWidget {
  const _ContactHeader();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Row(
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
          'Contacto',
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
    );
  }
}

class _ContactContent extends StatelessWidget {
  const _ContactContent();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '¿Hablamos?',
          style: AppTextStyles.heroPrefix.copyWith(
            fontSize: isMobile ? 30 : 34,
            height: 1.1,
            color: AppColors.magenta,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Estoy abierta a oportunidades como desarrolladora junior en proyectos de aplicaciones móviles, web o multiplataforma. Tengo disponibilidad en Málaga y Murcia, además de modalidad remota o híbrida.',
          style: AppTextStyles.body.copyWith(
            fontSize: isMobile ? 14.7 : 15.5,
            height: 1.65,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 34),
        const ContactInfoItem(
          icon: Icons.email_outlined,
          label: 'EMAIL',
          value: ContactSection.email,
        ),
        const SizedBox(height: 24),
        const ContactInfoItem(
          icon: Icons.location_on_outlined,
          label: 'UBICACIÓN',
          value: 'Málaga / Murcia, España',
        ),
        const SizedBox(height: 24),
        const ContactInfoItem(
          icon: Icons.bolt_rounded,
          label: 'DISPONIBILIDAD',
          value: 'Remoto / Híbrido / Presencial',
        ),
        const SizedBox(height: 34),
        const Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            ContactSocialButton(
              label: 'LinkedIn',
              url: AppLinks.linkedIn,
              icon: FontAwesomeIcons.linkedinIn,
            ),
            ContactSocialButton(
              label: 'GitHub',
              url: AppLinks.github,
              icon: FontAwesomeIcons.github,
            ),
          ],
        ),
      ],
    );
  }
}