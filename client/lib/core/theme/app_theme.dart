import 'package:flutter/material.dart';

class AppTheme {
  // Define your gradient colors  
  static const Color gradientStart = Color(0xFFF9F9F9);
  static const Color gradientEnd = Color(0xFFECECEC);
  
  // Define the gradient
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      gradientStart,
      gradientEnd,
    ],
  );

  static ThemeData get themeData => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF97316)),
    scaffoldBackgroundColor: gradientStart,
  );
}