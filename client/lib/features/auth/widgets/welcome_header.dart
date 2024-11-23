import 'package:flutter/material.dart';
import 'package:iron_track/core/widgets/app_logo.dart';
import 'package:iron_track/features/auth/constants/strings.dart';

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

    return Semantics(
      header: true,
      label: '${AuthStrings.welcome.welcome} IronTrack. ${AuthStrings.welcome.tagline}',
      child: Column(
        children: [
          Semantics(
            header: true,
            child: Text(
              AuthStrings.welcome.welcome,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: _verticalSpacing),
          AppLogo(textStyle: headlineLarge, withIcon: false, alignment: MainAxisAlignment.center,),
          const SizedBox(height: _verticalSpacing),
          Semantics(
            child: Text(
              AuthStrings.welcome.tagline,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge,
            )
          ),
        ],
      ),
    );
  }
}
