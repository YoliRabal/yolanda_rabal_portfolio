import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';
import 'app_nav_bar.dart';

class AppNavBarDelegate extends SliverPersistentHeaderDelegate {
  AppNavBarDelegate({
    required this.context,
  });

  final BuildContext context;

  @override
  double get minExtent => ResponsiveHelper.navHeight(context);

  @override
  double get maxExtent => ResponsiveHelper.navHeight(context);

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return const AppNavBar();
  }

  @override
  bool shouldRebuild(covariant AppNavBarDelegate oldDelegate) {
    return true;
  }
}