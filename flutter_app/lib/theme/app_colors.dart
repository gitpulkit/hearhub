import 'package:flutter/material.dart';
import '../settings/settings_scope.dart';

/// HearHub color palette.
///
/// Prefers [AppSettings] (via [SettingsScope]) so Light/Dark flips on the same
/// frame as the toggle, then falls back to [Theme].
class AppColors {
  AppColors._();

  // —— Light ——
  static const Color _lightBackground = Color(0xFFF5F4F2);
  static const Color _lightForeground = Color(0xFF2B2B2B);
  static const Color _lightCard = Color(0xFFFFFFFF);
  static const Color _lightPrimary = Color(0xFF7C5CBF);
  static const Color _lightPrimaryForeground = Color(0xFFFFFFFF);
  static const Color _lightSecondary = Color(0xFFE8E4F5);
  static const Color _lightAccent = Color(0xFFF5D8E2);
  static const Color _lightMutedForeground = Color(0xFF8C8C8C);
  static const Color _lightBorder = Color(0xFFE8E4F5);

  // —— Dark ——
  static const Color _darkBackground = Color(0xFF16141C);
  static const Color _darkForeground = Color(0xFFF2F0F5);
  static const Color _darkCard = Color(0xFF221F2B);
  static const Color _darkPrimary = Color(0xFF9B7FD4);
  static const Color _darkPrimaryForeground = Color(0xFFFFFFFF);
  static const Color _darkSecondary = Color(0xFF2C2838);
  static const Color _darkAccent = Color(0xFF3A2A32);
  static const Color _darkMutedForeground = Color(0xFFA39EAB);
  static const Color _darkBorder = Color(0xFF3A3548);

  static bool isDark(BuildContext context) {
    final settings = SettingsScope.maybeOf(context);
    if (settings != null) return settings.isDark;
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color background(BuildContext context) =>
      isDark(context) ? _darkBackground : _lightBackground;

  static Color foreground(BuildContext context) =>
      isDark(context) ? _darkForeground : _lightForeground;

  static Color card(BuildContext context) =>
      isDark(context) ? _darkCard : _lightCard;

  static Color primary(BuildContext context) =>
      isDark(context) ? _darkPrimary : _lightPrimary;

  static Color primaryForeground(BuildContext context) =>
      isDark(context) ? _darkPrimaryForeground : _lightPrimaryForeground;

  static Color secondary(BuildContext context) =>
      isDark(context) ? _darkSecondary : _lightSecondary;

  static Color accent(BuildContext context) =>
      isDark(context) ? _darkAccent : _lightAccent;

  static Color mutedForeground(BuildContext context) =>
      isDark(context) ? _darkMutedForeground : _lightMutedForeground;

  static Color border(BuildContext context) =>
      isDark(context) ? _darkBorder : _lightBorder;
}
