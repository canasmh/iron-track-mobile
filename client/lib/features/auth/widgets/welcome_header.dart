import 'package:flutter/material.dart';
import 'package:iron_track/core/widgets/app_logo.dart';

/// A header widget displayed on the welcome screen showing the app logo
/// and welcome message. This widget adapts to the current theme and
/// text styles.
class WelcomeHeader extends StatelessWidget {
  static const double _verticalSpacing = 16.0;

  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final headlineLarge = textTheme.headlineLarge;
    
    if (headlineLarge == null) {
      throw FlutterError(
        'No headlineLarge style found in the current theme.',
      );
    }

    return Column(
      children: [
        Text(
          _Strings.welcome,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium,
        ),
        const SizedBox(height: _verticalSpacing),
        AppLogo(textStyle: headlineLarge),
        const SizedBox(height: _verticalSpacing),
        Text(
          _Strings.tagline,
          textAlign: TextAlign.center,
          style: textTheme.titleLarge,
        )
      ],
    );
  }
}

/// Strings used in the welcome header.
/// Could be moved to a localization file if needed.
abstract class _Strings {
  static const welcome = 'Welcome to';
  static const tagline = 'A better way to\ntrack your routines';
  
  // Prevent instantiation
  const _Strings._();
}