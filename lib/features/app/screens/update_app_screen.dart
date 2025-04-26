import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../auth/screens/email_verification_screen.dart';

class UpdateAppScreen extends StatelessWidget {
  const UpdateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/logo.png',
                height: 120,
              ),
              const SizedBox(height: 24),
              const Text(
                'Aggiorna l\'app',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Questa versione non è più supportata.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Scarica l\'ultimo aggiornamento per continuare ad ordinare e tornare a gustare i tuoi piatti preferiti!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const Spacer(),
              CustomButton(
                text: 'Aggiorna l\'app',
                onPressed: () {
                  // For demo purposes, navigate to email verification
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EmailVerificationScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}