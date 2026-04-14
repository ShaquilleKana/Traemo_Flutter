import 'package:flutter/material.dart';

/// Design tokens from `src/styles/theme.css` (light / dark).
abstract final class AppColors {
  // Light
  static const Color lightBackground = Color(0xFFF8FAF9);
  static const Color lightForeground = Color(0xFF0F1C1A);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightPrimary = Color(0xFF10B981);
  static const Color lightPrimaryForeground = Color(0xFFFFFFFF);
  static const Color lightSecondary = Color(0xFFF0FDF4);
  static const Color lightSecondaryForeground = Color(0xFF0F1C1A);
  static const Color lightMuted = Color(0xFFF1F5F3);
  static const Color lightMutedForeground = Color(0xFF6B7280);
  static const Color lightAccent = Color(0xFFECFDF5);
  static const Color lightAccentForeground = Color(0xFF0F1C1A);
  static const Color lightDestructive = Color(0xFFEF4444);
  static const Color lightDestructiveForeground = Color(0xFFFFFFFF);
  static const Color lightInputBackground = Color(0xFFF9FAFB);
  static const Color lightSwitchBackground = Color(0xFFD1D5DB);
  static const Color lightIncome = Color(0xFF10B981);
  static const Color lightExpense = Color(0xFFEF4444);

  static Color get lightBorder =>
      const Color(0xFF10B981).withValues(alpha: 0.1);

  // Dark
  static const Color darkBackground = Color(0xFF0A0F0E);
  static const Color darkForeground = Color(0xFFF0FDF4);
  static const Color darkCard = Color(0xFF111918);
  static const Color darkPrimary = Color(0xFF10B981);
  static const Color darkPrimaryForeground = Color(0xFFFFFFFF);
  static const Color darkSecondary = Color(0xFF1A2E28);
  static const Color darkSecondaryForeground = Color(0xFFF0FDF4);
  static const Color darkMuted = Color(0xFF1A2E28);
  static const Color darkMutedForeground = Color(0xFF9CA3AF);
  static const Color darkAccent = Color(0xFF1A2E28);
  static const Color darkAccentForeground = Color(0xFFF0FDF4);
  static const Color darkDestructive = Color(0xFFEF4444);
  static const Color darkDestructiveForeground = Color(0xFFFFFFFF);
  static const Color darkInputBackground = Color(0xFF1A2E28);
  static const Color darkSwitchBackground = Color(0xFF374151);
  static const Color darkIncome = Color(0xFF10B981);
  static const Color darkExpense = Color(0xFFEF4444);

  static Color get darkBorder =>
      const Color(0xFF10B981).withValues(alpha: 0.15);

  /// Chart grid stroke (matches DashboardScreen recharts).
  static const Color chartGridLight = Color(0xFFF1F5F3);
  static const Color chartGridDark = Color(0xFF1A2E28);
}
