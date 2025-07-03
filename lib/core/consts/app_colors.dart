import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color darkBlue = Color(0xFF1E40AF);
  static const Color lightBlue = Color(0xFFDBEAFE);

  // Secondary / Accent
  static const Color redactBlack = Color(0xFF111827); // for redaction blocks
  static const Color alertRed = Color(0xFFEF4444);
  static const Color softGrey = Color(0xFFE5E7EB);
  static const Color mutedTextGrey = Color(0xFF6B7280);

  // Backgrounds
  static const Color background = Color.fromARGB(216, 249, 250, 251);
  static const Color card = Color(0xFFFFFFFF);
  static const Color darkModeBackground = Color(0xFF0F172A);

  // Status Colors
  static const Color successGreen = Color(0xFF10B981);
  static const Color warningYellow = Color(0xFFF59E0B);

  // Text
  static const Color textPrimary = redactBlack;
  static const Color textMuted = mutedTextGrey;

  // Utility
  static const Color transparent = Colors.transparent;
}
