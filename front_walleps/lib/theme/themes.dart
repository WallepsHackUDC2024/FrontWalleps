import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Color(0xFFB100E8);
  static const Color secondaryColor = Color(0xFFFF930A);
  static const Color redColor = Color(0xFFEB1F26);
  static const Color yellowColor = Color(0xFFFFC60A);
  static const Color blueColor = Color(0xFF0D9DFD);
  static const Color greenColor = Color(0xFF34E000);
  static const Color lightGrayColor = Color(0xFFE5E5E5);
  static const Color grayColor = Color(0xFFACACAC);
  static const Color lightBlackColor = Color(0xFF141414);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      onPrimary: whiteColor,
      secondary: secondaryColor,
      onSecondary: blackColor,
      background: whiteColor,
      onBackground: blackColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: blackColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      onPrimary: whiteColor,
      secondary: secondaryColor,
      onSecondary: blackColor,
      background: lightBlackColor,
      onBackground: whiteColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: whiteColor),
    ),
  );
}
