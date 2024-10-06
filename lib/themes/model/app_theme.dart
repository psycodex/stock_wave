import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:stock_wave/config.dart';

import '../controllers/theme_controller.dart';

/// The theme for this app is defined in
class AppTheme {
  AppTheme._();

  /// Function to build our example light theme.
  static ThemeData light(ThemeController controller) {
    return ThemeData(
      brightness: Brightness.light,
    );
  }
}

final Color primaryColor = Color(0xFF3C3F41);
final Color primaryColorDark = Color(0xFF2B2B2B);
final Color primaryColorLight = Color(0xFF4E5254);
final Color accentColor = Color(0xFF6897BB);
final Color backgroundColor = Color(0xFF2B2B2B);
final Color textColor = Color(0xFFA9B7C6);
final Color cardColor = Color(0xFF3C3F41);
final Color dividerColor = Color(0xFF606366);
final Color errorColor = Color(0xFFCF6679);

final ThemeData darculaTheme = ThemeData(
  brightness: Brightness.dark,
  // primaryColor: primaryColor,
  // primaryColorDark: primaryColorDark,
  // primaryColorLight: primaryColorLight,
  // hintColor: accentColor,
  // scaffoldBackgroundColor: backgroundColor,
  // cardColor: cardColor,
  // dividerColor: dividerColor,
  // textTheme: TextTheme(
  //   bodyLarge: TextStyle(color: textColor),
  //   bodyMedium: TextStyle(color: textColor),
  //   headlineLarge: TextStyle(color: textColor),
  //   headlineMedium: TextStyle(color: textColor),
  //   headlineSmall: TextStyle(color: textColor),
  //   titleLarge: TextStyle(color: textColor),
  //   titleMedium: TextStyle(color: textColor),
  //   titleSmall: TextStyle(color: textColor),
  // ),
  // iconTheme: IconThemeData(color: textColor),
  // appBarTheme: AppBarTheme(
  //   color: primaryColor,
  //   iconTheme: IconThemeData(color: textColor),
  // ),
  // colorScheme: ColorScheme(
  //   brightness: Brightness.dark,
  //   primary: primaryColor,
  //   onPrimary: textColor,
  //   secondary: accentColor,
  //   onSecondary: primaryColorDark,
  //   error: errorColor,
  //   onError: primaryColorDark,
  //   background: backgroundColor,
  //   onBackground: textColor,
  //   surface: cardColor,
  //   onSurface: textColor,
  // ),
);
