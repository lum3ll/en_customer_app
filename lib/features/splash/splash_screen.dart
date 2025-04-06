import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/image_paths.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePaths.splashLogo, width: 170),
            const SizedBox(height: 24),
            Image.asset(ImagePaths.splashText, width: 330),
            const SizedBox(height: 24),
            const Text(
              'te lo portiamo noi',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            const SizedBox(height: 118),
            Image.asset(ImagePaths.splashIcons, width: 292),
          ],
        ),
      ),
    );
  }
}
