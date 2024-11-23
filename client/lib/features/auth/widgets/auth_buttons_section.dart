import 'package:flutter/material.dart';
import 'package:iron_track/features/auth/constants/strings.dart';

class AuthButtonsSection extends StatelessWidget {
  static const double _buttonSpacing = 16.0;

  final VoidCallback onLoginPressed;
  final VoidCallback onSignUpPressed;
  final bool isLoading;

  const AuthButtonsSection({
    super.key,
    required this.onLoginPressed,
    required this.onSignUpPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // This makes buttons full width
      children: [
        FilledButton(
          onPressed: isLoading ? null : onLoginPressed,
          child: isLoading 
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : Text(AuthStrings.buttons.login),
        ),
        const SizedBox(height: _buttonSpacing),
        OutlinedButton(
          onPressed: isLoading ? null : onSignUpPressed,
          child: Text(AuthStrings.buttons.signUp),
        ),
      ],
    );
  }
}