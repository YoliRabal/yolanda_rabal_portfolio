import 'package:flutter/material.dart';

class AppScrollController {
  const AppScrollController._();

  static final ScrollController scrollController = ScrollController();

  static final GlobalKey homeKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey certificatesKey = GlobalKey();
  static final GlobalKey educationKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();

  static const String projectsSection = 'projects';
  static const String educationSection = 'education';
  static const String certificatesSection = 'certificates';
  static const String contactSection = 'contact';

  static final ValueNotifier<String?> activeSection = ValueNotifier<String?>(
    null,
  );

  static Future<void> scrollTo(
      GlobalKey key, {
        String? section,
      }) async {
    final context = key.currentContext;

    if (context == null) {
      return;
    }

    activeSection.value = section;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0.02,
    );
  }

  static void updateActiveSectionFromScroll() {
    final educationTop = _sectionTop(educationKey);

    if (educationTop == null) {
      activeSection.value = null;
      return;
    }

    const activationOffset = 130;

    if (educationTop <= activationOffset) {
      activeSection.value = educationSection;
    } else {
      activeSection.value = null;
    }
  }

  static double? _sectionTop(GlobalKey key) {
    final context = key.currentContext;

    if (context == null) {
      return null;
    }

    final renderObject = context.findRenderObject();

    if (renderObject is! RenderBox) {
      return null;
    }

    return renderObject.localToGlobal(Offset.zero).dy;
  }
}