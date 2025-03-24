import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_button.dart';

class CodeVerificationScreen extends StatelessWidget {
  final String phoneNumber;

  const CodeVerificationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Inserisci il codice'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verifica il Codice',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  const TextSpan(text: 'Abbiamo inviato al tuo numero '),
                  TextSpan(
                    text: phoneNumber,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const TextSpan(text: ' il codice a 6 cifre per la verifica'),
                ],
              ),
            ),
            const SizedBox(height: 72),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: const InputDecoration(
                hintText: '689665',
                counterText: '',
              ),
            ),
            const SizedBox(height: 18),
            CustomButton(
              text: 'Verifica',
              onPressed: () {
                // TODO: Implement code verification
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Reinvia codice',
              backgroundColor: Colors.white,
              textColor: AppColors.primary,
              borderColor: AppColors.primary,
              borderWidth: 1,
              onPressed: () {
                // TODO: Implement code resending
              },
            ),
          ],
        ),
      ),
    );
  }
}