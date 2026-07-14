import 'package:flutter/material.dart';

import '../../app/app_scroll_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_nav_bar_delegate.dart';
import 'presentation/presentation_section.dart';
import 'studies/studies_section.dart';
import 'certificates/certificates_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    AppScrollController.scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    AppScrollController.scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  void _handleScroll() {
    AppScrollController.updateActiveSectionFromScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        controller: AppScrollController.scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: AppNavBarDelegate(context: context),
          ),
          const SliverToBoxAdapter(
            child: PresentationSection(),
          ),
          const SliverToBoxAdapter(
            child: StudiesSection(),
          ),
          const SliverToBoxAdapter(
            child: CertificatesSection(),
          ),
        ],
      ),
    );
  }
}