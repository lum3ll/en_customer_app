import 'package:flutter/material.dart';
import '../../../core/constants/input_decorations.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_button.dart';
import 'phone_verification_screen.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Registrati o accedi con la tua email'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            const Text('Registrati o Accedi', style: AppTextStyles.title),
            const SizedBox(height: 8),
            const Text(
              'Inserisci la tua email per accedere a E-Need\r\noppure per effettuare la registrazione',
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 72),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: AppTextStyles.inputText,
              decoration: AppInputDecorations.textField(
                hintText: 'Indirizzo email',
              ),
            ),
            const SizedBox(height: 18),
            CustomButton(
              text: 'Accedi',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PhoneVerificationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
