import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.inter().fontFamily,
      
     
       primaryColor: AppColors.gold500,
    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.light(
      primary: AppColors.gold500,
      secondary: AppColors.black,
      background: Colors.white,
    ),
     

      // AppBar
      appBarTheme: const AppBarTheme(
        
  systemOverlayStyle: SystemUiOverlayStyle(
    
    statusBarColor: Colors.transparent, // transparent status bar
    statusBarIconBrightness: Brightness.dark, // dark icons (Android)
    statusBarBrightness: Brightness.light, // dark icons (iOS)
  ),
  backgroundColor: Colors.transparent,
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.black),
  titleTextStyle: TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),


      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF0000),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // TextFields
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,

        filled: false,
        hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFFF0000)),
        ),
      ),

      // Text Styles
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF4A4A4A)),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
