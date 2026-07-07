import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/responsive_helper.dart';

class HeroBackgroundImage extends StatelessWidget {
  const HeroBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ResponsiveHelper.width(context);
    final screenHeight = ResponsiveHelper.height(context);

    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    final imageWidth = isMobile
        ? screenWidth * 1.25
        : isTablet
        ? screenWidth * 0.95
        : screenWidth * 0.82;

    final imageHeight = isMobile
        ? screenHeight * 0.78
        : isTablet
        ? screenHeight * 0.76
        : screenHeight * 0.86;

    return Positioned(
      top: isMobile ? 70 : -30,
      right: isMobile ? -180 : 100,
      child: IgnorePointer(
        child: SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: Image.asset(
            AppAssets.heroBackground,
            fit: BoxFit.contain,
            alignment: Alignment.topRight,
          ),
        ),
      ),
    );
  }
}