import 'package:flutter/material.dart';

import 'education_timeline_item.dart';

class EducationTimeline extends StatelessWidget {
  const EducationTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final items = _educationItems;

    return Column(
      children: List.generate(
        items.length,
            (index) {
          final item = items[index];

          return EducationTimelineItem(
            period: item.period,
            title: item.title,
            institution: item.institution,
            description: item.description,
            chips: item.chips,
            isLast: index == items.length - 1,
          );
        },
      ),
    );
  }
}

class _EducationItem {
  const _EducationItem({
    required this.period,
    required this.title,
    required this.institution,
    required this.description,
    required this.chips,
  });

  final String period;
  final String title;
  final String institution;
  final String description;
  final List<String> chips;
}

const List<_EducationItem> _educationItems = [
  _EducationItem(
    period: '2023 - 2025',
    title: 'CFGS - Desarrollo de Aplicaciones Multiplataforma',
    institution: 'Universidad Europea',
    description:
    'Formación técnica orientada al diseño, desarrollo, implementación y mantenimiento de aplicaciones multiplataforma. Trabajo con programación orientada a objetos, desarrollo móvil, bases de datos relacionales, servicios en la nube y ciclo completo de desarrollo de software. Durante las prácticas en Pizzacorn.es participé en el desarrollo de aplicaciones móviles desde cero con Flutter y Firebase.',
    chips: [
      'Flutter',
      'Firebase',
      'Java',
      'Kotlin',
      'SQL',
      'Spring Boot',
      'Unity',
      'GitHub',
    ],
  ),
  _EducationItem(
    period: '2018 - 2023',
    title: 'Máster en TAV, Localización, Subtitulación y Doblaje',
    institution: 'ISTRAD - Instituto Superior de Estudios Lingüísticos y Traducción',
    description:
    'Especialización práctica en traducción audiovisual y localización de contenidos digitales, con formación en subtitulación, doblaje, adaptación de textos y control de calidad lingüística. Desarrollo de proyectos individuales y colaborativos siguiendo flujos profesionales, con atención a restricciones técnicas, temporales y culturales.',
    chips: [
      'Localización',
      'QA lingüístico',
      'Subtitulación',
      'Doblaje',
      'Trados Studio',
      'MemoQ',
      'Aegisub',
      'VisualSubSync',
    ],
  ),
  _EducationItem(
    period: '2014 - 2018',
    title: 'Grado en Traducción e Interpretación',
    institution: 'Universidad de Murcia',
    description:
    'Formación en traducción, interpretación y mediación lingüística en entornos multilingües. Desarrollo de competencias en análisis textual, reformulación, revisión, documentación terminológica y traducción directa e inversa en inglés, francés y español. Incluye movilidad Erasmus en la Université de Liège y prácticas en el Departamento de Traducción.',
    chips: [
      'EN-FR-ES',
      'Traducción',
      'Revisión',
      'Documentación',
      'CAT Tools',
      'Interpretación',
    ],
  ),
];