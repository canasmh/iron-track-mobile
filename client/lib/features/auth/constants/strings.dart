/// Strings used in the welcome header.
///
abstract class AuthStrings {
  static const WelcomeStrings welcome = WelcomeStrings._();
  static const ButtonStrings buttons = ButtonStrings._();
  static const SocialStrings social = SocialStrings._();

  const AuthStrings._();
}

class WelcomeStrings {
  final String welcome = 'Welcome to';
  final String tagline = 'A better way to\ntrack your routines';

  const WelcomeStrings._();
}

class ButtonStrings {
  final String login = 'Log In';
  final String signUp = 'Sign Up';

  const ButtonStrings._();
}

class SocialStrings {
  final String continueWith = 'Continue With';

  const SocialStrings._();
}
