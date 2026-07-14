import 'package:flutter/material.dart';

import '../../../app/app_scroll_controller.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/responsive_container.dart';
import 'widgets/certificate_card.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      key: AppScrollController.certificatesKey,
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.only(
        top: isMobile ? 25 : 30,
        bottom: isMobile ? 64 : 90,
      ),
      child: ResponsiveContainer(
        maxWidth: 1500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CertificatesHeader(),
            SizedBox(height: isMobile ? 34 : 46),
            const _CertificatesGrid(),
          ],
        ),
      ),
    );
  }
}

class _CertificatesHeader extends StatelessWidget {
  const _CertificatesHeader();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
              'Certificados',
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
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: isMobile ? double.infinity : 820,
          child: Text(
            'Formación complementaria orientada a metodologías ágiles, inteligencia artificial, gestión de proyectos y competencias digitales.',
            style: AppTextStyles.body.copyWith(
              fontSize: isMobile ? 14.5 : 15.5,
              height: 1.6,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _CertificatesGrid extends StatelessWidget {
  const _CertificatesGrid();

  @override
  Widget build(BuildContext context) {
    final width = ResponsiveHelper.width(context);

    final cardWidth = _cardWidth(width);
    final cardHeight = _cardHeight(width);

    return Center(
      child: Wrap(
        spacing: 22,
        runSpacing: 22,
        alignment: WrapAlignment.center,
        children: const [
          CertificateCard(
            imagePath: AppAssets.genericCertificate,
            title: 'Iniciación al Desarrollo con IA',
            institution: 'BIG School',
            date: '2026',
            clipImageAsCircle: false,
            description:
            'Formación introductoria sobre el uso de inteligencia artificial como apoyo al desarrollo, la creación de soluciones digitales y el aprendizaje aplicado a proyectos tecnológicos.',
          ),
          CertificateCard(
            imagePath: AppAssets.digitalExperiencesCertificate,
            title: 'Experiencias Digitales | Intermediate',
            institution: 'Universidad Europea Online',
            date: '2025',
            verificationUrl:
            'https://badges.parchment.eu/public/assertions/o-KZigVTRV6qZ82lXC8DZg?utm_source=url_copy&identity__email=yoli.rabal.adan%40gmail.com',
            description:
            'Formación centrada en la comprensión del entorno digital, la transformación tecnológica y las competencias necesarias para desenvolverse en proyectos digitales.',
          ),
          CertificateCard(
            imagePath: AppAssets.artificialIntelligenceCertificate,
            title: 'Inteligencia Artificial | Intermediate',
            institution: 'Universidad Europea Online',
            date: '2025',
            verificationUrl:
            'https://badges.parchment.eu/public/assertions/HWambERSQbKKikGK5BizXg?utm_source=url_copy&identity__email=yoli.rabal.adan%40gmail.com',
            description:
            'Introducción al uso de la inteligencia artificial en contextos profesionales, automatización de tareas, productividad y comprensión de herramientas basadas en IA.',
          ),
          CertificateCard(
            imagePath: AppAssets.projectPortfolioCertificate,
            title: 'Project Portfolio Management | Advanced',
            institution: 'Universidad Europea Online',
            date: '2024',
            verificationUrl:
            'https://badges.parchment.eu/public/assertions/2g-EpjLCR3Sb_CnlWYQhmA?utm_source=url_copy&identity__email=yoli.rabal.adan%40gmail.com',
            description:
            'Formación sobre gestión de portfolios de proyectos, priorización, planificación, seguimiento y visión estratégica dentro de entornos organizativos.',
          ),
          CertificateCard(
            imagePath: AppAssets.agileScrumCertificate,
            title: 'Agile y Scrum | Advanced',
            institution: 'Universidad Europea Online',
            date: '2024',
            verificationUrl:
            'https://badges.parchment.eu/public/assertions/0fInrm7pR32lMEfWnGgiSw?utm_source=url_copy&identity__email=yoli.rabal.adan%40gmail.com',
            description:
            'Formación en metodologías ágiles, roles de Scrum, organización del trabajo, iteraciones, retrospectivas y mejora continua en equipos de desarrollo.',
          ),
        ]
            .map(
              (card) => SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: card,
          ),
        )
            .toList(),
      ),
    );
  }

  static double _cardWidth(double width) {
    if (width >= 1250) return 390;
    if (width >= 820) return 360;
    return double.infinity;
  }

  static double _cardHeight(double width) {
    if (width >= 1250) return 420;
    if (width >= 820) return 430;
    return 410;
  }
}