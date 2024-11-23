import 'package:flutter/material.dart';
import 'package:iron_track/features/auth/widgets/auth_buttons_section.dart';
import 'package:iron_track/features/auth/widgets/social_login_section.dart';

/// A widget that displays authentication options including email/password
/// login buttons and social login options.
class AuthOptions extends StatelessWidget {
  const AuthOptions({ super.key });

  void _handleLogin() {
    debugPrint('Login pressed');
  }
  void _handleSignUp() {
    debugPrint('Sign Up pressed');
  }

  void _handleSocialLogin(String provider) { 
    debugPrint('Social Login Pressed: $provider');
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Column(
      children: [
        AuthButtonsSection(
          onLoginPressed: _handleLogin,
          onSignUpPressed: _handleSignUp,
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