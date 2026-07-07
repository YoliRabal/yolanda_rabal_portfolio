import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle navName = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.6,
    color: AppColors.textPrimary,
  );

  static TextStyle navItem = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle heroPrefix = GoogleFonts.montserrat(
    fontSize: 46,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    height: 1,
  );

  static TextStyle heroName = GoogleFonts.montserrat(
    fontSize: 66,
    fontWeight: FontWeight.w900,
    height: 1,
  );

  static TextStyle heroRole = GoogleFonts.robotoMono(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    letterSpacing: 3.5,
    color: AppColors.magenta,
  );

  static TextStyle heroBody = GoogleFonts.montserrat(
    fontSize: 16.5,
    fontWeight: FontWeight.w400,
    height: 1.55,
    color: AppColors.textPrimary,
  );

  static TextStyle sectionTitle = GoogleFonts.robotoMono(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: AppColors.magenta,
  );

  static TextStyle cardTitle = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static TextStyle body = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.55,
    color: AppColors.textSecondary,
  );

  static TextStyle bodySmall = GoogleFonts.montserrat(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static TextStyle button = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle chip = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
}