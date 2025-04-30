import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../home/screens/home_screen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Success icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.thumb_up,
                  color: AppColors.primary,
                  size: 60,
                ),
              ),
              const SizedBox(height: 24),
              // Success message
              const Text(
                'Pagamento effettuato\ncon successo!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BalooTamma2',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Order status message
              const Text(
                'Il tuo ordine è in preparazione,\nti aggiorneremo a breve sullo stato della consegna',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'BalooTamma2',
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Track order button
              CustomButton(
                text: 'Segui il tuo ordine',
                onPressed: () {
                  // Navigate to order tracking screen
                },
                backgroundColor: AppColors.primary,
                textColor: Colors.white,
              ),
              const SizedBox(height: 16),
              // Explore restaurants button
              CustomButton(
                text: 'Esplora altri ristoranti',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false,
                  );
                },
                backgroundColor: Colors.white,
                textColor: AppColors.primary,
                borderColor: AppColors.primary,
                borderWidth: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}