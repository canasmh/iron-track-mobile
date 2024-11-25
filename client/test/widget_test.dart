import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iron_track/main.dart';
import 'package:iron_track/features/auth/screens/welcome_screen.dart';

void main() {
  group('IronTrack Widget Tests', () {
    testWidgets('IronTrack should display WelcomeScreen as initial route',
        (WidgetTester tester) async {
      await tester.pumpWidget(const IronTrack());

      expect(find.byType(WelcomeScreen), findsOneWidget,
          reason: 'WelcomeScreen should be the initial route');

      final MaterialApp materialApp = tester.widget(find.byType(MaterialApp));
      expect(materialApp.title, 'Iron Track',
          reason: 'App title should be set to Iron Track');
      expect(materialApp.debugShowCheckedModeBanner, false,
          reason: 'Debug banner should be disabled');
    });
  });
}
