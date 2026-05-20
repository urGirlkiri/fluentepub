import 'package:fluentepub/config/pallete.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  const Palette palette = Palette();
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: palette.platinum, 

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
      titleTextStyle: TextStyle(
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: palette.platinum, 
      hintStyle: TextStyle(color: palette.inkBlack.withValues(alpha: .4)),
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