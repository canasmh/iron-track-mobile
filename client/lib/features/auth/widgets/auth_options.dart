import 'package:flutter/material.dart';
import 'auth_buttons_section.dart';
import 'social_login_section.dart';

/// A widget that displays authentication options including email/password
/// login buttons and social login options.
class AuthOptions extends StatelessWidget {
  final VoidCallback onLoginTap;
  final VoidCallback onSignUpTap;

  const AuthOptions({
    super.key,
    required this.onLoginTap,
    required this.onSignUpTap,
  });

  void _handleSocialLogin(String provider) {
    debugPrint('Social Login Pressed: $provider');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthButtonsSection(
          onLoginTap: onLoginTap,
          onSignUpTap: onSignUpTap,
        ),
        SizedBox(height: 32),
        SocialLoginSection(
          onAppleLogin: () => _handleSocialLogin('Apple'),
          onFacebookLogin: () => _handleSocialLogin('Facebook'),
          onGoogleLogin: () => _handleSocialLogin('Google'),
          onTwitterLogin: () => _handleSocialLogin('Twitter'),
        ),
      ],
    );
  }
}
