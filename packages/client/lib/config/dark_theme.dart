import 'package:fluentepub/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  const Palette palette = Palette();

  final baseTextTheme = GoogleFonts.interTextTheme(ThemeData.dark().textTheme);

  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: palette.inkBlack,

    iconTheme: IconThemeData(
      color: palette.powderBlue,
      size: 24.0,
      opacity: 0.9,
    ),
    textTheme: baseTextTheme.copyWith(
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: palette.platinum),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: palette.platinum),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        color: palette.platinum,
        fontWeight: FontWeight.bold,
      ),
    ),

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
      titleTextStyle: GoogleFonts.inter(
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
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: palette.inkBlack,
      hintStyle: GoogleFonts.inter(
        color: palette.platinum.withValues(alpha: .5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
