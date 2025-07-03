import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme get lightTextTheme => TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.black87,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Colors.grey[600],
    ),
  );

  static TextTheme get darkTextTheme => TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Colors.white70,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: Colors.grey[400],
    ),
  );
}
