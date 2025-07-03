import 'package:flutter/material.dart';
import 'package:redact_safe/core/consts/app_colors.dart';
import 'package:redact_safe/core/consts/app_text_theme.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: const Color.from(alpha: 1, red: 0.145, green: 0.388, blue: 0.922),
    cardColor: AppColors.card,
    textTheme: AppTextTheme.lightTextTheme,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.successGreen,
      error: AppColors.alertRed,
    ),
  );
}
