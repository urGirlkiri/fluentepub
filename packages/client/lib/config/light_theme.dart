import 'package:fluentepub/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  const Palette palette = Palette();
  
  final baseTextTheme = GoogleFonts.interTextTheme(ThemeData.light().textTheme);

  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: palette.platinum, 

    iconTheme: IconThemeData(
      color: palette.yaleBlue, 
      size: 24.0,              
      opacity: 0.9,           
    ),

    textTheme: baseTextTheme.copyWith(
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: palette.inkBlack),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: palette.inkBlack),
      titleLarge: baseTextTheme.titleLarge?.copyWith(color: palette.inkBlack, fontWeight: FontWeight.bold),
    ),

    colorScheme: ColorScheme.light(
      surface: Colors.white, 
      primary: palette.yaleBlue, 
      secondary: palette.powderBlue, 
      onSurface: palette.inkBlack,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1, 
      iconTheme: IconThemeData(color: palette.yaleBlue),
      actionsIconTheme: IconThemeData(color: palette.yaleBlue),
      titleTextStyle: GoogleFonts.inter(
        color: palette.inkBlack,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: palette.yaleBlue, 
        foregroundColor: palette.platinum, 
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: palette.platinum, 
      hintStyle: GoogleFonts.inter(color: palette.inkBlack.withValues(alpha: .4)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black12, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black12, width: 1),
      ),
    ),
  );
}