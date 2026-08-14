import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF10B981);
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkCardBackground = Color(0xFF1E293B);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        surface: darkCardBackground,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: const CardTheme(
        color: darkCardBackground,
        elevation: 2,
      ),
    );
  }
}
