import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // App Logo
              const Icon(
                Icons.check_circle_outline,
                size: 100,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(height: 24),

              // Welcome Text
              const Text(
                'Welcome to Todo App',
                style: AppTheme.titleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Organize your tasks efficiently',
                style: AppTheme.subtitleStyle,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),

              // Action Buttons
              WelcomeButton(
                text: 'Get Started',
                onPressed: () {
                  // TODO: Navigate to tasks screen
                },
                isPrimary: true,
              ),
              WelcomeButton(
                text: 'Sign In',
                onPressed: () {
                  // TODO: Navigate to sign in screen
                },
                isPrimary: false,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
