import 'package:flutter/material.dart';

import '../../../app/app_scroll_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/responsive_container.dart';
import 'widgets/project_card.dart';
import 'widgets/project_media_placeholder.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      key: AppScrollController.projectsKey,
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.only(
        top: isMobile ? 40 : 52,
        bottom: isMobile ? 32 : 42,
      ),
      child: ResponsiveContainer(
        maxWidth: 1500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ProjectsHeader(),
            SizedBox(height: isMobile ? 30 : 40),
            ...List.generate(
              _projects.length,
                  (index) {
                final project = _projects[index];

                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == _projects.length - 1
                        ? 0
                        : isMobile
                        ? 28
                        : 36,
                  ),
                  child: ProjectCard(
                    title: project.title,
                    subtitle: project.subtitle,
                    description: project.description,
                    highlights: project.highlights,
                    technologies: project.technologies,
                    actions: project.actions,
                    mediaType: project.mediaType,
                    reverseLayout: index.isOdd,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectsHeader extends StatelessWidget {
  const _ProjectsHeader();

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
              'Proyectos',
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
          width: isMobile ? double.infinity : 850,
          child: Text(
            'Aplicaciones móviles, web y de escritorio desarrolladas con Flutter, Firebase, Kotlin, Java, SQL y tecnologías backend.',
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

class _ProjectData {
  const _ProjectData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.highlights,
    required this.technologies,
    required this.actions,
    required this.mediaType,
  });

  final String title;
  final String subtitle;
  final String description;
  final List<String> highlights;
  final List<String> technologies;
  final List<ProjectAction> actions;
  final ProjectMediaType mediaType;
}

const List<_ProjectData> _projects = [
  _ProjectData(
    title: 'Spotter - Entrena acompañado',
    subtitle: 'App móvil para cliente real · Publicada en tiendas',
    description:
    'Aplicación social fitness desarrollada con Flutter y Firebase para conectar personas con intereses deportivos. La app permite crear perfiles, descubrir usuarios mediante un sistema de swipe, hacer match y mantener conversaciones privadas.',
    highlights: [
      'Onboarding y autenticación de usuarios.',
      'Perfiles con imágenes y datos personales.',
      'Sistema de swipe, match y chat privado.',
      'Gestión de imágenes, ubicación y notificaciones.',
      'Publicación en Google Play y App Store.',
    ],
    technologies: [
      'Flutter',
      'Firebase',
      'Firestore',
      'Firebase Auth',
      'Storage',
      'Cloud Messaging',
    ],
    actions: [
      ProjectAction(
        label: 'Google Play',
        url: 'https://play.google.com/store/apps/details?id=com.spotter.com&hl=es_419',
        icon: Icons.shop_rounded,
      ),
      ProjectAction(
        label: 'App Store',
        url: 'https://apps.apple.com/us/app/spotter-entrena-acompa%C3%B1ado/id6755760038',
        icon: Icons.apple_rounded,
      ),
    ],
    mediaType: ProjectMediaType.mobile,
  ),
  _ProjectData(
    title: 'Smart Food Service',
    subtitle: 'App Android para gestión de pedidos en restaurante',
    description:
    'Aplicación Android desarrollada en Kotlin con Firebase para gestionar pedidos en un restaurante. Incluye diferentes roles de usuario, flujo de mesa y cocina, menú por categorías, extras, carrito y actualización de pedidos en tiempo real.',
    highlights: [
      'Roles diferenciados para mesa y cocina.',
      'Menú organizado por categorías y productos.',
      'Gestión de extras, carrito y pedidos.',
      'Pedidos en tiempo real con Firebase.',
      'Estados de cocina, cierre y cobro del pedido.',
    ],
    technologies: [
      'Kotlin',
      'Firebase',
      'Firestore',
      'Android',
      'Material Design',
    ],
    actions: [
      ProjectAction(
        label: 'Ver código',
        url: 'https://github.com/YoliRabal/SmartFoodService_App',
        icon: Icons.code_rounded,
      ),
    ],
    mediaType: ProjectMediaType.desktop,
  ),
  _ProjectData(
    title: 'TaskFlow',
    subtitle: 'App Android para gestión de tareas',
    description:
    'Aplicación Android orientada a la organización personal y gestión de tareas. Incluye autenticación, creación y edición de tareas, calendario, estadísticas de progreso y una estructura pensada para mantener el código ordenado y escalable.',
    highlights: [
      'Login y gestión de usuarios.',
      'CRUD completo de tareas.',
      'Calendario y seguimiento de progreso.',
      'Estadísticas y visualización de avance.',
      'Arquitectura MVVM con Jetpack Compose.',
    ],
    technologies: [
      'Kotlin',
      'Firebase',
      'Jetpack Compose',
      'MVVM',
      'Firestore',
    ],
    actions: [
      ProjectAction(
        label: 'Ver código',
        url: 'https://github.com/YoliRabal/TaskFlow',
        icon: Icons.code_rounded,
      ),
    ],
    mediaType: ProjectMediaType.mobile,
  ),
  _ProjectData(
    title: 'AulaNotas',
    subtitle: 'Aplicación de escritorio para gestión académica',
    description:
    'Aplicación de escritorio desarrollada con JavaFX y MySQL para la gestión académica de un centro educativo. Permite trabajar con roles, alumnado, profesorado, docencias, matrículas y calificaciones por evaluación.',
    highlights: [
      'Sistema de login por roles.',
      'Gestión de alumnado, profesorado y docencias.',
      'Matrículas y asignación académica.',
      'Calificaciones organizadas por evaluación.',
      'Conexión a base de datos MySQL mediante JDBC.',
    ],
    technologies: [
      'Java',
      'JavaFX',
      'MySQL',
      'JDBC',
      'SQL',
      'FXML',
    ],
    actions: [
      ProjectAction(
        label: 'Ver código',
        url: 'https://github.com/YoliRabal/AulaNotas',
        icon: Icons.code_rounded,
      ),
    ],
    mediaType: ProjectMediaType.desktop,
  ),
];