import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iron_track/features/auth/widgets/social_login_section.dart';
import 'package:iron_track/features/auth/constants/strings.dart';

void main() {
  group('SocialLoginSection', () {
    late ThemeData theme;

    setUp(() {
      // Setup a theme for consistent testing
      theme = ThemeData.light();
    });

    Widget buildTestWidget({
      VoidCallback? onFacebookLogin,
      VoidCallback? onTwitterLogin,
      VoidCallback? onGoogleLogin,
      VoidCallback? onAppleLogin,
    }) {
      return MaterialApp(
        theme: theme,
        home: Scaffold(
          body: SocialLoginSection(
            onFacebookLogin: onFacebookLogin,
            onTwitterLogin: onTwitterLogin,
            onGoogleLogin: onGoogleLogin,
            onAppleLogin: onAppleLogin,
          ),
        ),
      );
    }

    testWidgets('renders divider with correct text', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget());

      // Verify divider text
      expect(
        find.text(AuthStrings.social.continueWith), 
        findsOneWidget,
        reason: 'Should show "Continue With" text',
      );

      // Verify dividers
      expect(
        find.byType(Divider), 
        findsNWidgets(2),
        reason: 'Should show two dividers',
      );
    });

    testWidgets('renders all social buttons with correct icons', 
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget());

      // Verify all IconButtons are present
      expect(find.byType(IconButton), findsNWidgets(4));

      // Verify specific icons
      expect(
        find.byWidgetPredicate(
          (widget) => widget is FaIcon && 
                     widget.icon == FontAwesomeIcons.facebook
        ), 
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) => widget is FaIcon && 
                     widget.icon == FontAwesomeIcons.xTwitter
        ), 
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) => widget is FaIcon && 
                     widget.icon == FontAwesomeIcons.google
        ), 
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) => widget is FaIcon && 
                     widget.icon == FontAwesomeIcons.apple
        ), 
        findsOneWidget,
      );
    });

    testWidgets('social buttons have correct tooltips', 
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget());

      final buttons = tester.widgetList<IconButton>(find.byType(IconButton));
      
      expect(
        buttons.any((button) => button.tooltip == 'Continue with Facebook'),
        isTrue,
      );
      expect(
        buttons.any((button) => button.tooltip == 'Continue with Twitter'),
        isTrue,
      );
      expect(
        buttons.any((button) => button.tooltip == 'Continue with Google'),
        isTrue,
      );
      expect(
        buttons.any((button) => button.tooltip == 'Continue with Apple'),
        isTrue,
      );
    });

    testWidgets('buttons trigger correct callbacks when pressed', 
        (WidgetTester tester) async {
      // ARRANGE
      bool facebookPressed = false;
      bool twitterPressed = false;
      bool googlePressed = false;
      bool applePressed = false;

      await tester.pumpWidget(
        buildTestWidget(
          onFacebookLogin: () => facebookPressed = true,
          onTwitterLogin: () => twitterPressed = true,
          onGoogleLogin: () => googlePressed = true,
          onAppleLogin: () => applePressed = true,
        ),
      );

      // ACT & ASSERT - Facebook
      await tester.tap(find.byWidgetPredicate(
        (widget) => widget is FaIcon && 
                    widget.icon == FontAwesomeIcons.facebook
      ));
      expect(facebookPressed, isTrue);
      expect(twitterPressed, isFalse);
      expect(googlePressed, isFalse);
      expect(applePressed, isFalse);

      // ACT & ASSERT - Twitter
      await tester.tap(find.byWidgetPredicate(
        (widget) => widget is FaIcon && 
                    widget.icon == FontAwesomeIcons.xTwitter
      ));
      expect(twitterPressed, isTrue);

      // ACT & ASSERT - Google
      await tester.tap(find.byWidgetPredicate(
        (widget) => widget is FaIcon && 
                    widget.icon == FontAwesomeIcons.google
      ));
      expect(googlePressed, isTrue);

      // ACT & ASSERT - Apple
      await tester.tap(find.byWidgetPredicate(
        (widget) => widget is FaIcon && 
                    widget.icon == FontAwesomeIcons.apple
      ));
      expect(applePressed, isTrue);
    });

    testWidgets('buttons are disabled when callbacks are null', 
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget());

      final buttons = tester.widgetList<IconButton>(find.byType(IconButton));
      for (final button in buttons) {
        expect(button.onPressed, isNull);
      }
    });

    testWidgets('maintains correct spacing between buttons', 
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget());

      final spacers = tester.widgetList<SizedBox>(
        find.byType(SizedBox),
      ).where((spacer) => spacer.width != null);

      for (final spacer in spacers) {
        expect(
          spacer.width, 
          16.0,
          reason: 'Horizontal spacing between buttons should be 16.0',
        );
      }
    });
  });
}