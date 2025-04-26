import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../home/screens/home_screen.dart';

class AddressConfirmationScreen extends StatelessWidget {
  const AddressConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for text fields
    final nameController = TextEditingController(text: 'Casa dei nonni');
    final streetController = TextEditingController(text: 'Via Antonio Ciseri');
    final numberController = TextEditingController(text: '49/B');
    final floorController = TextEditingController();
    final cityController = TextEditingController(text: 'Locarno');
    final zipController = TextEditingController(text: '6516');
    final phoneController = TextEditingController(text: '+39 3456789221');

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Conferma il tuo indirizzo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Consegneremo i tuoi ordini a questo indirizzo, accertati che sia corretto.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              
              // Address form fields using CustomTextField
              CustomTextField(
                label: 'Nome indirizzo',
                controller: nameController,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: 'Via',
                controller: streetController,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: 'Numero civico',
                controller: numberController,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: 'Scala/Piano (Opzionale)',
                controller: floorController,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: 'Città',
                controller: cityController,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: 'CAP',
                controller: zipController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: 'Numero di telefono',
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
              
              const SizedBox(height: 8),
              const Text(
                'Lo useremo per contattarti riguardo le consegne',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Confirm button
              CustomButton(
                text: 'Conferma indirizzo',
                onPressed: () {
                  // Navigate to home screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 20), // Add some padding at the bottom
            ],
          ),
        ),
      ),
    );
  }
}