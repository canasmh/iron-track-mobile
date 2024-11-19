// Start by cleaning up main.dart to just this:
import 'package:flutter/material.dart';
import 'package:iron_track/core/theme/app_theme.dart';
import 'package:iron_track/features/auth/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iron Track',
      theme: AppTheme.themeData,
      home: const WelcomeScreen(),  // We'll create this next
    );
  }
}