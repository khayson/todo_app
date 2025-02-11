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
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              // Welcome Illustration
              Container(
                width: double.infinity,
                height: 240,
                decoration: const BoxDecoration(
                  color: Color(0xFFE3F2FD), // Light blue background
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 120,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Welcome Text Section
              const Column(
                children: [
                  Text(
                    'Task Management',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Organize your tasks and\nboost your productivity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Action Buttons in Row
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: WelcomeButton(
                        text: 'Sign Up',
                        onPressed: () {
                          // TODO: Navigate to sign up screen
                        },
                        isPrimary: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: WelcomeButton(
                        text: 'Login',
                        onPressed: () {
                          // TODO: Navigate to login screen
                        },
                        isPrimary: false,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
