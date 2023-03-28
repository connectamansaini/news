import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Primary Color
  static const primaryColor = Colors.deepPurpleAccent;
  static final primaryColorLight = Colors.deepPurpleAccent.shade100;
  static final primaryColorDark = Colors.deepPurpleAccent.shade700;

  // Light theme colors
  static const lightThemePrimaryFontColor = Colors.black;
  static const lightThemeSecondaryFontColor =
      Color.fromARGB(255, 100, 100, 100);
  static final lightThemeTertiaryFontColor = Colors.grey.shade400;
  static const lightThemeFloatingActionButtonColor = Colors.teal;

  // Dark theme colors
  static const darkThemePrimaryFontColor = Colors.white;
  static final darkThemeSecondaryFontColor = Colors.grey.shade800;
  static final darkThemeTertiaryFontColor = Colors.grey.shade600;
  static const darkThemeFloatingActionButtonColor = Colors.tealAccent;
}
