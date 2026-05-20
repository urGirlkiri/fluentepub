import 'package:fluentepub/config/pallete.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  const Palette palette = Palette();
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: palette.inkBlack,

    colorScheme: ColorScheme.dark(
      surface: palette.yaleBlue,
      primary: palette.powderBlue,
      onSurface: palette.platinum,
      secondary: palette.powderBlue,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: palette.yaleBlue,
      elevation: 0,
      iconTheme: IconThemeData(color: palette.powderBlue),
      titleTextStyle: TextStyle(
        color: palette.platinum,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: palette.powderBlue,
        foregroundColor: palette.inkBlack,
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: palette.inkBlack,
      hintStyle: TextStyle(color: palette.platinum.withValues(alpha: .5)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
