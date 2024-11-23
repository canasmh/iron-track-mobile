import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iron_track/features/auth/constants/strings.dart';

/// A section displaying social authentication options with a divider.
/// 
/// Presents Facebook, Twitter, Google, and Apple sign-in buttons
/// arranged horizontally below a "Continue With" divider.
/// 
class SocialLoginSection extends StatelessWidget {
  static const double _horizontalSpacing = 16.0;
  static const double _verticalSpacing = 32.0;
  static const double _iconSize = 32.0;

  final VoidCallback? onFacebookLogin;
  final VoidCallback? onTwitterLogin;
  final VoidCallback? onGoogleLogin;
  final VoidCallback? onAppleLogin;

  const SocialLoginSection({
    super.key,
    this.onFacebookLogin,
    this.onTwitterLogin,
    this.onGoogleLogin,
    this.onAppleLogin,
  });


  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        _buildDividerWithText(context),
        const SizedBox(height: _verticalSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(
              icon: FontAwesomeIcons.facebook,
              onPressed: onFacebookLogin,
              label: 'Continue with Facebook',
              color: primaryColor,
            ),
            const SizedBox(width: _horizontalSpacing),
            _buildSocialButton(
              icon: FontAwesomeIcons.xTwitter,
              onPressed: onTwitterLogin,
              label: 'Continue with Twitter',
              color: primaryColor,
            ),
            const SizedBox(width: _horizontalSpacing),
            _buildSocialButton(
              icon: FontAwesomeIcons.google,
              onPressed: onGoogleLogin,
              label: 'Continue with Google',
              color: primaryColor,
            ),
            const SizedBox(width: _horizontalSpacing),
            _buildSocialButton(
              icon: FontAwesomeIcons.apple,
              onPressed: onAppleLogin,
              label: 'Continue with Apple',
              color: primaryColor,
            ),
          ],
        )
      ],
    );
  }
  Widget _buildDividerWithText(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: primaryColor,
    );

    return Row(
      children: [
        Expanded(
          child: Divider(color: primaryColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: _horizontalSpacing,
          ),
          child: Text(
            AuthStrings.social.continueWith,
            style: textStyle,
          ),
        ),
        Expanded(
          child: Divider(color: primaryColor),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      iconSize: _iconSize,
      tooltip: label,  // Adds accessibility label
      icon: FaIcon(
        icon,
        color: color,
      ),
    );
  }
}
