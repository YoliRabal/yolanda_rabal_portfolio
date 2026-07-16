import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'project_action_button.dart';
import 'project_media_placeholder.dart';
import 'project_tech_tag.dart';

class ProjectAction {
  const ProjectAction({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final IconData icon;
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.highlights,
    required this.technologies,
    required this.actions,
    required this.mediaType,
    this.reverseLayout = false,
  });

  final String title;
  final String subtitle;
  final String description;
  final List<String> highlights;
  final List<String> technologies;
  final List<ProjectAction> actions;
  final ProjectMediaType mediaType;
  final bool reverseLayout;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 22 : 34),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(26),
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
            blurRadius: 30,
            spreadRadius: 1,
          ),
        ],
      ),
      child: isMobile ? _mobileLayout() : _desktopLayout(),
    );
  }

  Widget _desktopLayout() {
    final content = Expanded(
      flex: 5,
      child: _ProjectContent(
        title: title,
        subtitle: subtitle,
        description: description,
        highlights: highlights,
        technologies: technologies,
        actions: actions,
      ),
    );

    final media = Expanded(
      flex: 6,
      child: ProjectMediaPlaceholder(
        title: title,
        type: mediaType,
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: reverseLayout
          ? [
        media,
        const SizedBox(width: 38),
        content,
      ]
          : [
        content,
        const SizedBox(width: 38),
        media,
      ],
    );
  }

  Widget _mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectMediaPlaceholder(
          title: title,
          type: mediaType,
        ),
        const SizedBox(height: 26),
        _ProjectContent(
          title: title,
          subtitle: subtitle,
          description: description,
          highlights: highlights,
          technologies: technologies,
          actions: actions,
        ),
      ],
    );
  }
}

class _ProjectContent extends StatelessWidget {
  const _ProjectContent({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.highlights,
    required this.technologies,
    required this.actions,
  });

  final String title;
  final String subtitle;
  final String description;
  final List<String> highlights;
  final List<String> technologies;
  final List<ProjectAction> actions;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.heroPrefix.copyWith(
            fontSize: isMobile ? 30 : 34,
            height: 1.1,
            color: AppColors.magenta,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: AppTextStyles.heroRole.copyWith(
            fontSize: isMobile ? 12.2 : 13.2,
            letterSpacing: 1.25,
            color: AppColors.cyan,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: AppTextStyles.body.copyWith(
            fontSize: isMobile ? 14.3 : 15,
            height: 1.58,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 20),
        _HighlightsList(
          highlights: highlights,
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies
              .map(
                (tech) => ProjectTechTag(label: tech),
          )
              .toList(),
        ),
        if (actions.isNotEmpty) ...[
          const SizedBox(height: 26),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: actions
                .map(
                  (action) => ProjectActionButton(
                label: action.label,
                url: action.url,
                icon: action.icon,
              ),
            )
                .toList(),
          ),
        ],
      ],
    );
  }
}

class _HighlightsList extends StatelessWidget {
  const _HighlightsList({
    required this.highlights,
  });

  final List<String> highlights;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: highlights
          .map(
            (highlight) => Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.check_rounded,
                size: 18,
                color: AppColors.cyan,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  highlight,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 13.5,
                    height: 1.45,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          .toList(),
    );
  }
}