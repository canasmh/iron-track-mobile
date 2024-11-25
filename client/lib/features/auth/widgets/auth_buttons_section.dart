import 'package:flutter/material.dart';
import '../constants/strings.dart';

/// A section containing authentication-related buttons (Login and Sign Up)
///
/// Shows loading state in the login button when processing.
///
class AuthButtonsSection extends StatelessWidget {
  static const double _buttonSpacing = 16.0;

  final VoidCallback onLoginTap;
  final VoidCallback onSignUpTap;
  final bool isLoading;

  const AuthButtonsSection({
    super.key,
    required this.onLoginTap,
    required this.onSignUpTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.stretch, // This makes buttons full width
      children: [
        FilledButton(
          onPressed: isLoading ? null : onLoginTap,
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
          onPressed: isLoading ? null : onSignUpTap,
          child: Text(AuthStrings.buttons.signUp),
        ),
      ],
    );
  }
}
