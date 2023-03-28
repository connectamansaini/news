import 'package:flutter/material.dart';
import 'package:news/src/core/presentation/colors.dart';
import 'package:news/src/core/presentation/constants.dart';
import 'package:news/src/core/presentation/topography.dart';

class AppThemes {
  AppThemes._();

  /// Light Theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
    ),
    fontFamily: Constants.fontFamily,
    textTheme: const TextTheme(
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
    ),
    tabBarTheme: const TabBarTheme(
      labelStyle: AppTypography.tabBarLabelTextStyle,
      unselectedLabelStyle: AppTypography.tabBarLabelUnselectedTextStyle,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightThemeFloatingActionButtonColor,
    ),
  );

  /// Dark Theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
    ),
    fontFamily: Constants.fontFamily,
    textTheme: TextTheme(
      bodyLarge: AppTypography.bodyLarge.copyWith(
        color: AppColors.darkThemePrimaryFontColor,
      ),
      bodyMedium: AppTypography.bodyMedium.copyWith(
        color: AppColors.darkThemePrimaryFontColor,
      ),
      bodySmall: AppTypography.bodySmall.copyWith(
        color: AppColors.darkThemePrimaryFontColor,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: AppTypography.tabBarLabelTextStyle,
      unselectedLabelStyle:
          AppTypography.tabBarLabelUnselectedTextStyle.copyWith(
        color: AppColors.darkThemeSecondaryFontColor,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkThemeFloatingActionButtonColor,
    ),
  );
}

extension ThemeDataX on ThemeData {
  /// Is current theme mode dark
  bool get isDark => brightness == Brightness.dark;

  //* Font Colors
  /// Primary font color based on theme mode
  Color get primaryFontColor => isDark
      ? AppColors.darkThemePrimaryFontColor
      : AppColors.lightThemePrimaryFontColor;

  /// Secondary font color based on theme mode
  Color get secondaryFontColor => isDark
      ? AppColors.darkThemeSecondaryFontColor
      : AppColors.lightThemeSecondaryFontColor;

  /// Tertiary font color based on theme mode
  Color get tertiaryFontColor => isDark
      ? AppColors.darkThemeTertiaryFontColor
      : AppColors.lightThemeTertiaryFontColor;

//* Title text styles
  TextStyle get titleSmallPrimary =>
      AppTypography.titleSmall.copyWith(color: primaryFontColor);

  TextStyle get titleMediumPrimary =>
      AppTypography.titleMedium.copyWith(color: primaryFontColor);

  TextStyle get titleLargePrimary =>
      AppTypography.titleLarge.copyWith(color: primaryFontColor);

  TextStyle get titleSmallSecondary =>
      AppTypography.bodySmall.copyWith(color: secondaryFontColor);

  TextStyle get titleMediumSecondary =>
      AppTypography.bodyMedium.copyWith(color: secondaryFontColor);

  TextStyle get titleLargeSecondary =>
      AppTypography.bodyLarge.copyWith(color: secondaryFontColor);

  TextStyle get titleSmallTertiary =>
      AppTypography.bodySmall.copyWith(color: tertiaryFontColor);

  TextStyle get titleMediumTertiary =>
      AppTypography.bodyMedium.copyWith(color: tertiaryFontColor);

  TextStyle get titleLargeTertiary =>
      AppTypography.bodyLarge.copyWith(color: tertiaryFontColor);

  //* Body text styles
  TextStyle get bodySmallPrimary =>
      AppTypography.bodySmall.copyWith(color: primaryFontColor);

  TextStyle get bodySmallSecondary =>
      AppTypography.bodySmall.copyWith(color: secondaryFontColor);

  TextStyle get bodySmallTertiary =>
      AppTypography.bodySmall.copyWith(color: tertiaryFontColor);

  TextStyle get bodyMediumPrimary =>
      AppTypography.bodyMedium.copyWith(color: primaryFontColor);

  TextStyle get bodyMediumSecondary =>
      AppTypography.bodyMedium.copyWith(color: secondaryFontColor);

  TextStyle get bodyMediumTertiary =>
      AppTypography.bodyMedium.copyWith(color: tertiaryFontColor);

  TextStyle get bodyLargePrimary =>
      AppTypography.bodyLarge.copyWith(color: primaryFontColor);

  TextStyle get bodyLargeSecondary =>
      AppTypography.bodyLarge.copyWith(color: secondaryFontColor);

  TextStyle get bodyLargeTertiary =>
      AppTypography.bodyLarge.copyWith(color: tertiaryFontColor);

  //* Caption text styles
  TextStyle get captionPrimary =>
      AppTypography.caption.copyWith(color: primaryFontColor);

  TextStyle get captionSecondary =>
      AppTypography.caption.copyWith(color: secondaryFontColor);

  TextStyle get captionTertiary =>
      AppTypography.caption.copyWith(color: tertiaryFontColor);
}
