import 'package:flutter/material.dart';
import 'package:news/src/core/presentation/colors.dart';
import 'package:news/src/core/presentation/constants.dart';

class AppTypography {
  AppTypography._();

  //* TextStyle
  // Title textStyles
  static const titleLarge = TextStyle(
    fontFamily: Constants.fontFamily,
    fontSize: Constants.largeTitleFontSize,
    color: AppColors.lightThemePrimaryFontColor,
  );

  static const titleMedium = TextStyle(
    fontFamily: Constants.fontFamily,
    fontSize: Constants.mediumTitleFontSize,
    color: AppColors.lightThemePrimaryFontColor,
  );

  static const titleSmall = TextStyle(
    fontFamily: Constants.fontFamily,
    fontSize: Constants.smallTitleFontSize,
    color: AppColors.lightThemePrimaryFontColor,
  );

  // Body textStyles
  static const bodyLarge = TextStyle(
    fontFamily: Constants.fontFamily,
    fontSize: Constants.largeBodyFontSize,
    color: AppColors.lightThemePrimaryFontColor,
  );

  static const bodyMedium = TextStyle(
    fontFamily: Constants.fontFamily,
    fontSize: Constants.mediumBodyFontSize,
    color: AppColors.lightThemePrimaryFontColor,
  );

  static const bodySmall = TextStyle(
    fontFamily: Constants.fontFamily,
    fontSize: Constants.smallBodyFontSize,
    color: AppColors.lightThemePrimaryFontColor,
  );

  // Caption text styles
  static const caption = TextStyle(
    fontFamily: Constants.fontFamily,
    fontSize: Constants.captionFontSize,
    color: AppColors.lightThemePrimaryFontColor,
  );

  //* TabBar label textStyles
  static const tabBarLabelTextStyle = TextStyle(
    fontSize: Constants.largeBodyFontSize,
    fontWeight: FontWeight.bold,
    fontFamily: Constants.fontFamily,
    color: AppColors.primaryColor,
  );

  static const tabBarLabelUnselectedTextStyle = TextStyle(
    fontSize: Constants.largeBodyFontSize,
    fontWeight: FontWeight.bold,
    fontFamily: Constants.fontFamily,
    color: AppColors.lightThemeSecondaryFontColor,
  );
}
