// lib/features/auth/screens/welcome_screen.dart
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iron Track'),
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,  // Light grey color
            width: 1.0,               // Border width
          ),
        ),
      ),
      body: Text('Hello, World!'),
    );
  }
}

