import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines the core color palette for the application
///
class AppColors {
  // Primary Orange Palette
  static const Color primary100 = Color.fromRGBO(249, 116, 22, 0.1);
  static const Color primary300 = Color.fromRGBO(249, 116, 22, 0.75);
  static const Color primary500 = Color(0xFFF97316);
  static const Color primary700 = Color(0xFFEA580C);
  static const Color primary900 = Color(0xFFC2410C);

  // Neutral Gray Palette
  static const Color neutral100 = Color(0xFFF9F9F9);
  static const Color neutral200 = Color(0xFFEBEBEB);
  static const Color neutral300 = Color(0xFFDCDCDC);
  static const Color neutral400 = Color(0xFFAAAAAA);
  static const Color neutral500 = Color(0xFF918E8D);
  static const Color neutral600 = Color(0xFF767472);
  static const Color neutral700 = Color(0xFF6C6967);
  static const Color neutral800 = Color(0xFF585554);
  static const Color neutral900 = Color(0xFF464645);

  // Semantic/State colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFDC3545);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);
}

/// Defines gradients used in the application
class AppGradients {
  static const LinearGradient background = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.neutral100,
      AppColors.neutral200,
    ],
  );
}

/// Defines text styles used throughout the application
class AppTextStyles {
  static final TextTheme theme = TextTheme(
    // Large Title
    displayLarge: GoogleFonts.robotoSerif(
      fontSize: 34,
      letterSpacing: 2,
      color: AppColors.neutral900,
    ),
    // Title 1
    headlineLarge: GoogleFonts.robotoSerif(
      fontSize: 28,
      letterSpacing: 2,
      color: AppColors.neutral900,
      fontWeight: FontWeight.w600,
    ),
    // Title 2
    headlineMedium: GoogleFonts.roboto(
      fontSize: 22,
      letterSpacing: 2,
      color: AppColors.neutral600,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 17,
      letterSpacing: 1,
      fontWeight: FontWeight.w600,
      color: AppColors.neutral600,
    ),
    // Body Regular
    bodyLarge: GoogleFonts.roboto(
      fontSize: 17,
      color: AppColors.neutral500,
      fontWeight: FontWeight.w400,
    ),
    // Callout
    bodyMedium: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}

/// Main theme configuration for the application
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // Color Scheme
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      // Primary and its variants
      primary: AppColors.primary500,
      onPrimary: AppColors.neutral100,
      primaryContainer: AppColors.primary100,
      onPrimaryContainer: AppColors.primary900,

      // Secondary (using primary colors as it's your brand color)
      secondary: AppColors.primary300,
      onSecondary: AppColors.neutral100,
      secondaryContainer: AppColors.primary100,
      onSecondaryContainer: AppColors.primary700,

      // Surface colors
      surface: Colors.white,
      onSurface: AppColors.neutral700,
      surfaceContainerHighest: AppColors.neutral100,
      onSurfaceVariant: AppColors.neutral600,

      // Error colors
      error: AppColors.error,
      onError: Colors.white,
      errorContainer: Color(0xFFFFEDED),
      onErrorContainer: Color(0xFF8B0000),

      // Outline and shadow
      outline: AppColors.neutral400,
      shadow: AppColors.neutral900,

      // Inverse colors for contrast
      inverseSurface: AppColors.neutral800,
      onInverseSurface: AppColors.neutral100,
      inversePrimary: AppColors.primary100,

      // Scrim for modals
      scrim: Colors.black54,
    ),

    // Text Theme
    textTheme: AppTextStyles.theme,

    // Button Themes
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.neutral100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        minimumSize: const Size.fromHeight(48),
        padding: const EdgeInsets.all(16),
        textStyle: AppTextStyles.theme.bodyMedium,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: BorderSide(color: AppColors.primary500, width: 1),
        minimumSize: const Size.fromHeight(48),
        padding: const EdgeInsets.all(16),
        textStyle: AppTextStyles.theme.bodyMedium,
      ),
    ),
  );
}
