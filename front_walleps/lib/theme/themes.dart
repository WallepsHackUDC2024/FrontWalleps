import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Color(0xFF3CD846);
  static const Color secondaryColor = Color(0xFFAFFC41);
  static const Color tertiaryColor = Color(0xFF34B647);
  static const Color redColor = Color(0xFFEB1F26);
  static const Color yellowColor = Color(0xFFFFC60A);
  static const Color blueColor = Color(0xFF0D9DFD);
  static const Color purpleColor = Color(0xFFB100E8);
  static const Color lightGrayColor = Color(0xFFE5E5E5);
  static const Color grayColor = Color(0xFFACACAC);
  static const Color lightBlackColor = Color(0xFF141414);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      onPrimary: blackColor,
      secondary: secondaryColor,
      onSecondary: blackColor,
      tertiary: tertiaryColor,
      onTertiary: blackColor,
      background: whiteColor,
      onBackground: blackColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: blackColor, fontSize: 32.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: blackColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: blackColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: blackColor, fontSize: 20.0),
      bodyMedium: TextStyle(color: blackColor, fontSize: 16.0),
      bodySmall: TextStyle(color: blackColor, fontSize: 12.0),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      onPrimary: blackColor,
      secondary: secondaryColor,
      onSecondary: blackColor,
      tertiary: tertiaryColor,
      onTertiary: blackColor,
      background: lightBlackColor,
      onBackground: whiteColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: whiteColor, fontSize: 32.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: whiteColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: whiteColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: whiteColor, fontSize: 20.0),
      bodyMedium: TextStyle(color: whiteColor, fontSize: 16.0),
      bodySmall: TextStyle(color: whiteColor, fontSize: 12.0),
    ),
  );
}
