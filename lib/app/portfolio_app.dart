import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../features/home/home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yolanda Rabal | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),//
    );
  }
}