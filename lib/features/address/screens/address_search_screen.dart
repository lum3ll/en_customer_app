import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import 'address_confirmation_screen.dart';

class AddressSearchScreen extends StatelessWidget {
  const AddressSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: '',
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Chiudi',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cerca il tuo indirizzo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Inserisci un indirizzo',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        // For demo purposes, navigate to confirmation screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddressConfirmationScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // We'll leave the rest of the screen empty as shown in the image
          ],
        ),
      ),
    );
  }
}