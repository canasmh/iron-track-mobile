import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/signup';
  
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Back to Welcome'),
        ),
      ),
    );
  }
}