import 'package:flutter/material.dart';
import 'breakpoints.dart';

class ResponsiveHelper {
  const ResponsiveHelper._();

  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static bool isMobile(BuildContext context) {
    return width(context) < Breakpoints.mobile;
  }

  static bool isTablet(BuildContext context) {
    final w = width(context);
    return w >= Breakpoints.mobile && w < Breakpoints.desktop;
  }

  static bool isDesktop(BuildContext context) {
    return width(context) >= Breakpoints.desktop;
  }

  static bool isLargeDesktop(BuildContext context) {
    return width(context) >= Breakpoints.largeDesktop;
  }

  static double horizontalPadding(BuildContext context) {
    final w = width(context);

    if (w < 430) return 20;
    if (w < Breakpoints.mobile) return 28;
    if (w < Breakpoints.tablet) return 42;
    if (w < Breakpoints.desktop) return 56;
    if (w < Breakpoints.largeDesktop) return 70;

    return 78;
  }

  static double navHeight(BuildContext context) {
    final w = width(context);

    if (w < Breakpoints.mobile) return 72;
    if (w < Breakpoints.tablet) return 74;

    return 76;
  }

  static double heroTopPadding(BuildContext context) {
    final h = height(context);
    final w = width(context);

    if (w < Breakpoints.mobile) return 24;
    if (w < Breakpoints.desktop) return 30;
    if (h < 800) return 24;

    return 32;
  }

  static double heroPrefixSize(BuildContext context) {
    final h = height(context);
    final w = width(context);

    if (w < 430) return 30;
    if (w < Breakpoints.mobile) return 36;
    if (w < Breakpoints.tablet) return 40;
    if (w < Breakpoints.desktop) return 42;
    if (h < 800) return 42;

    return 44;
  }

  static double heroNameSize(BuildContext context) {
    final h = height(context);
    final w = width(context);

    if (w < 430) return 38;
    if (w < Breakpoints.mobile) return 46;
    if (w < Breakpoints.tablet) return 54;
    if (w < Breakpoints.desktop) return 60;
    if (h < 800) return 60;

    return 64;
  }

  static double heroRoleSize(BuildContext context) {
    final w = width(context);

    if (w < 430) return 11;
    if (w < Breakpoints.mobile) return 13;
    if (w < Breakpoints.tablet) return 14;

    return 15;
  }

  static double heroBodySize(BuildContext context) {
    final h = height(context);
    final w = width(context);

    if (w < Breakpoints.mobile) return 15;
    if (w < Breakpoints.desktop) return 15.5;
    if (h < 800) return 15.5;

    return 16;
  }

  static double heroTextWidth(BuildContext context) {
    final w = width(context);

    if (w < Breakpoints.mobile) return double.infinity;
    if (w < Breakpoints.tablet) return w * 0.84;
    if (w < Breakpoints.desktop) return w * 0.64;

    return 620;
  }

  static double aboutCardImageSize(BuildContext context) {
    final w = width(context);

    if (w < Breakpoints.mobile) return 150;
    if (w < Breakpoints.desktop) return 160;

    return 165;
  }

  static double chipHeight(BuildContext context) {
    final w = width(context);

    if (w < Breakpoints.mobile) return 40;
    if (w < Breakpoints.desktop) return 42;

    return 42;
  }

  static double chipIconSize(BuildContext context) {
    final w = width(context);

    if (w < Breakpoints.mobile) return 19;
    if (w < Breakpoints.desktop) return 21;

    return 21;
  }

  static double chipFontSize(BuildContext context) {
    final w = width(context);

    if (w < Breakpoints.mobile) return 13.5;
    if (w < Breakpoints.desktop) return 14;

    return 14.5;
  }
}