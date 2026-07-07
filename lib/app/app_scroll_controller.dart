import 'package:flutter/material.dart';

class AppScrollController {
  AppScrollController._();

  static final ScrollController scrollController = ScrollController();

  static final GlobalKey homeKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey certificatesKey = GlobalKey();
  static final GlobalKey educationKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();

  static Future<void> scrollTo(GlobalKey key) async {
    final context = key.currentContext;

    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }
}