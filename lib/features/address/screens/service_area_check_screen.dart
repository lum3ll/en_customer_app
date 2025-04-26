import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_button.dart';
import 'address_search_screen.dart';

class ServiceAreaCheckScreen extends StatelessWidget {
  const ServiceAreaCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Top section - Address and profile
              // Location and search bar
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Adesso',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Viale Venezia, 24',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
                          hintText: 'Ristoranti, spesa, piatti',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none,
                        ),
                        enabled: false,
                      ),
                    ),
                    Icon(Icons.tune, color: Colors.grey[400]),
                  ],
                ),
              ),
              
              // Middle section - Centered content
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Delivery illustration
                      Image.asset(
                        'assets/images/delivery_bike.png',
                        height: 200,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Zona non ancora coperta',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Non preoccuparti, ci stiamo lavorando!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Se lo desideri, ti informeremo via mail quando il servizio sarà disponibile.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Bottom section - Right aligned button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Avvisami quando sarà disponibile',
                      onPressed: () {
                        // For demo purposes, we'll navigate to the address search screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddressSearchScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}