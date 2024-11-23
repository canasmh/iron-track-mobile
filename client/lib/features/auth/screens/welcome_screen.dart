import 'package:flutter/material.dart';
import 'package:iron_track/core/theme/app_theme.dart';
import 'package:iron_track/core/widgets/app_logo.dart';
import 'package:iron_track/features/auth/screens/login_screen.dart';
import 'package:iron_track/features/auth/screens/signup_screen.dart';
import 'package:iron_track/features/auth/widgets/auth_options.dart';
import 'package:iron_track/features/auth/widgets/welcome_header.dart';

/// The initial screen shown to unauthenticated users.
/// Displays the app logo, welcome message, and authentication options.
class WelcomeScreen extends StatelessWidget {
  static const double _appBarHeight = 88.0;
  static const double _appBarSpacing = 16.0;
  static const double _borderWidth = 1.0;
  static const EdgeInsets _bodyPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 64.0,
  );

  void _handleLogin(BuildContext context) {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
    debugPrint('Login pressed');
  }

  void _handleSignUp(BuildContext context) {
    Navigator.of(context).pushNamed(SignUpScreen.routeName);
    debugPrint('Sign Up pressed');
  }

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea( 
          child: Padding(
            padding: _bodyPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WelcomeHeader(),
                AuthOptions(
                  onLoginTap: () => _handleLogin(context),
                  onSignUpTap: () => _handleSignUp(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      toolbarHeight: _appBarHeight,
      backgroundColor: colorScheme.surface,
      title: const AppLogo(),
      titleSpacing: _appBarSpacing,
      shape: Border(
        bottom: BorderSide(
          color: colorScheme.primary,
          width: _borderWidth,
        ),
      ),
    );
  }
}
