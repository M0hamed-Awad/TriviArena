import 'package:flutter/material.dart';
import 'package:trivi_arena/constants.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    // Colors
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      onPrimary: kTextColorLight,
      secondary: kSecondaryColor,
      onSecondary: kTextColorLight,
      surface: kNaturalLightColor,
      onSurface: kTextColorDark,
      brightness: Brightness.light,
    ),

    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kLightBackgroundColor,

    // Icons Theme
    iconTheme: IconThemeData(color: kPrimaryColor, size: 24),

    // Divider Theme
    dividerTheme: DividerThemeData(color: kNaturalDarkColor, thickness: 1),

    // Card Theme
    cardTheme: const CardTheme(color: kNaturalLightColor),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    // Colors
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      onPrimary: kTextColorLight,
      secondary: kSecondaryColor,
      onSecondary: kTextColorLight,
      surface: kNaturalDarkColor,
      onSurface: kTextColorLight,
      brightness: Brightness.dark,
    ),

    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kNaturalDarkColor,

    // Icons Theme
    iconTheme: IconThemeData(color: kPrimaryColor, size: 24),

    // Divider Theme
    dividerTheme: DividerThemeData(color: kNaturalLightColor, thickness: 1),

    // Card Theme
    cardTheme: const CardTheme(color: kNaturalDarkColor),
  );
}
