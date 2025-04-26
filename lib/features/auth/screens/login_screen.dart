import 'package:eneed_cust_app/features/auth/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_paths.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/wave_clipper.dart';
import '../../home/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                // Updated wave clipper with adjusted height
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 320,
                    color: AppColors.primary,
                    width: double.infinity,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 40.0, // Increased vertical padding
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Updated logo size and positioning
                        Image.asset(
                          ImagePaths.loginLogo,
                          width: 46,
                          height: 64,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ci vorrà solo un minuto',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'BalooTamma2'
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'Registrati o Accedi per continuare',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'BalooTamma2'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  _SocialButton(
                    text: 'Accedi con Google',
                    icon: ImagePaths.googleIcon,
                    onPressed: () {
                      // TODO: Implement Google sign in
                    },
                  ),
                  const SizedBox(height: 16),
                  _SocialButton(
                    text: 'Accedi con Apple',
                    icon: ImagePaths.appleIcon,
                    onPressed: () {
                      // TODO: Implement Apple sign in
                    },
                  ),
                  const SizedBox(height: 16),
                  _SocialButton(
                    text: 'Accedi con Facebook',
                    icon: ImagePaths.facebookIcon,
                    onPressed: () {
                      // TODO: Implement Facebook sign in
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Oppure'),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'Registrati o accedi con la tua email',
                    margin: 0,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EmailVerificationScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'Prosegui come ospite',
                    margin: 0,
                    backgroundColor: Colors.white,
                    textColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    borderWidth: 1,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Proseguendo si dà il consenso ai nostri Termini e Condizioni e si conferma di aver letto e compreso integralmente la nostra Informativa sulla Privacy.',
                    style: TextStyle(fontSize: 12, color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Utilizziamo i tuoi dati per offrirti un\'esperienza personalizzata e per migliorare il nostro servizio. Per maggiori informazioni leggi qui.',
                    style: TextStyle(fontSize: 12, color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.darkGrey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 24, height: 24),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
