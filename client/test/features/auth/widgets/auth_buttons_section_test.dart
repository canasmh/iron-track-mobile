import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iron_track/features/auth/widgets/auth_buttons_section.dart';
import 'package:iron_track/features/auth/constants/strings.dart';

void main() {
  group('AuthButtonsSection', () {
    testWidgets('renders login and signup buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthButtonsSection(
              onLoginTap: () => {},
              onSignUpTap: () => {},
            ),
          ),
        ),
      );

      // ASSERT
      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.text(AuthStrings.buttons.login), findsOneWidget);
      expect(find.text(AuthStrings.buttons.signUp), findsOneWidget);
    });

    testWidgets('buttons call correct callbacks when tapped',
        (WidgetTester tester) async {
      // ARRANGE
      bool loginTapped = false;
      bool signUpTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthButtonsSection(
              onLoginTap: () => loginTapped = true,
              onSignUpTap: () => signUpTapped = true,
            ),
          ),
        ),
      );

      // ACT & ASSERT - Login button
      await tester.tap(find.byType(FilledButton));
      expect(loginTapped, true);
      expect(signUpTapped, false);

      // ACT & ASSERT - Sign up button
      await tester.tap(find.byType(OutlinedButton));
      expect(signUpTapped, true);
    });

    testWidgets('shows loading indicator and disables buttons when loading',
        (WidgetTester tester) async {
      // ARRANGE
      bool loginTapped = false;
      bool signUpTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthButtonsSection(
              onLoginTap: () => loginTapped = true,
              onSignUpTap: () => signUpTapped = true,
              isLoading: true,
            ),
          ),
        ),
      );

      // ASSERT
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text(AuthStrings.buttons.login), findsNothing);

      // Verify buttons are disabled
      final FilledButton loginButton = tester.widget<FilledButton>(
        find.byType(FilledButton),
      );
      final OutlinedButton signUpButton = tester.widget<OutlinedButton>(
        find.byType(OutlinedButton),
      );
      expect(loginButton.onPressed, isNull);
      expect(signUpButton.onPressed, isNull);

      // Verify tapping doesn't trigger callbacks
      await tester.tap(find.byType(FilledButton));
      await tester.tap(find.byType(OutlinedButton));
      expect(loginTapped, false);
      expect(signUpTapped, false);
    });

    testWidgets('buttons stretch to full width', (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AuthButtonsSection(
                onLoginTap: () {},
                onSignUpTap: () {},
              ),
            ),
          ),
        ),
      );

      // ASSERT
      final Column column = tester.widget<Column>(find.byType(Column));
      expect(
        column.crossAxisAlignment,
        CrossAxisAlignment.stretch,
        reason: 'Column should stretch buttons to full width',
      );
    });

    testWidgets('maintains proper spacing between buttons',
        (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthButtonsSection(
              onLoginTap: () {},
              onSignUpTap: () {},
            ),
          ),
        ),
      );

      // ASSERT
      final SizedBox spacer = tester.widget<SizedBox>(
        find.byType(SizedBox),
      );
      expect(
        spacer.height,
        16.0,
        reason: 'Spacing between buttons should be 16.0',
      );
    });
  });
}
