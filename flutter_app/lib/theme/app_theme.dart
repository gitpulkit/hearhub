import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => _build(
        brightness: Brightness.light,
        background: const Color(0xFFF5F4F2),
        foreground: const Color(0xFF2B2B2B),
        card: const Color(0xFFFFFFFF),
        primary: const Color(0xFF7C5CBF),
        primaryForeground: const Color(0xFFFFFFFF),
        secondary: const Color(0xFFE8E4F5),
        border: const Color(0xFFE8E4F5),
      );

  static ThemeData get darkTheme => _build(
        brightness: Brightness.dark,
        background: const Color(0xFF16141C),
        foreground: const Color(0xFFF2F0F5),
        card: const Color(0xFF221F2B),
        primary: const Color(0xFF9B7FD4),
        primaryForeground: const Color(0xFFFFFFFF),
        secondary: const Color(0xFF2C2838),
        border: const Color(0xFF3A3548),
      );

  static ThemeData _build({
    required Brightness brightness,
    required Color background,
    required Color foreground,
    required Color card,
    required Color primary,
    required Color primaryForeground,
    required Color secondary,
    required Color border,
  }) {
    final isDark = brightness == Brightness.dark;
    final baseText = isDark
        ? ThemeData.dark().textTheme
        : ThemeData.light().textTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: primaryForeground,
        secondary: secondary,
        onSecondary: foreground,
        surface: background,
        onSurface: foreground,
        error: const Color(0xFFCF6679),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: background,
      cardColor: card,
      dividerColor: border,
      fontFamily: GoogleFonts.inter().fontFamily,
      textTheme: GoogleFonts.interTextTheme(baseText).apply(
        bodyColor: foreground,
        displayColor: foreground,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: foreground,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primary;
          return isDark ? const Color(0xFFBDBDBD) : null;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primary.withValues(alpha: 0.45);
          }
          return isDark ? const Color(0xFF3A3548) : null;
        }),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: primary,
        thumbColor: primary,
        inactiveTrackColor: secondary,
      ),
    );
  }
}
