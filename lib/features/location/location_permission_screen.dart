import 'package:flutter/material.dart';
import '../../core/constants/image_paths.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_button.dart';
import '../auth/screens/login_screen.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Condividi la posizione'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(ImagePaths.locationIcon, width: 120, height: 120),
                  const SizedBox(height: 40),
                  const Text(
                    'Condividi la tua posizione',
                    style: TextStyle(
                      fontFamily: 'BalooTamma2',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'La useremo per mostrarti ristoranti, negozi e supermercati nei dintorni e la mappa per ritirare i tuoi ordini',
                    style: TextStyle(
                      fontFamily: 'BalooTamma2',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              text: 'Continua',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
