import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/tech_chip.dart';

class TechStack extends StatelessWidget {
  const TechStack({super.key});

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