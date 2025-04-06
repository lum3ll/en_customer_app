import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/image_paths.dart';
import '../../shared/widgets/custom_button.dart';
import '../location/location_permission_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImagePaths.foodBackground,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  CustomButton(
                    backgroundColor: Colors.white,
                    textColor: AppColors.primary,
                    textSize: 20,
                    borderWidth: 2,
                    borderColor: AppColors.orange,
                    text: 'INIZIA',
                    margin: 43,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const LocationPermissionScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
