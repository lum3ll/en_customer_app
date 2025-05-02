import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_nav_bar.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  int _selectedNavIndex = 2; // Set to 2 for Orders tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "I tuoi ordini",
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Da consegnare',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BalooTamma2',
                ),
              ),
              const SizedBox(height: 16),
              _buildPendingOrderCard(
                orderNumber: '2894',
                estimatedArrival: '12:30-12:50',
                onTap: () {
                  // Navigate to order details
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Consegnati',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BalooTamma2',
                ),
              ),
              const SizedBox(height: 16),
              _buildDeliveredOrderCard(
                orderNumber: '2894',
                deliveryDate: '24 Gennaio 2025',
                hasReview: true,
                onTap: () {
                  // Navigate to order details
                },
              ),
              const SizedBox(height: 16),
              _buildDeliveredOrderCard(
                orderNumber: '2894',
                deliveryDate: '24 Gennaio 2025',
                hasReview: false,
                onTap: () {
                  // Navigate to order details
                },
              ),
              const SizedBox(height: 16),
              _buildDeliveredOrderCard(
                orderNumber: '2894',
                deliveryDate: '24 Gennaio 2025',
                hasReview: false,
                onTap: () {
                  // Navigate to order details
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedNavIndex,
        onTap: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
          
          // Handle navigation based on index
          if (index != _selectedNavIndex) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, '/search');
            } else if (index == 3) {
              Navigator.pushReplacementNamed(context, '/favorites');
            } else if (index == 4) {
              Navigator.pushReplacementNamed(context, '/cart');
            } else if (index == 5) {
              Navigator.pushReplacementNamed(context, '/account');
            }
          }
        },
      ),
    );
  }

  Widget _buildPendingOrderCard({
    required String orderNumber,
    required String estimatedArrival,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ordine #$orderNumber',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BalooTamma2',
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Arrivo stimato $estimatedArrival',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  // Track rider logic
                },
                child: Text(
                  'Segui il rider',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveredOrderCard({
    required String orderNumber,
    required String deliveryDate,
    required bool hasReview,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ordine #$orderNumber',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BalooTamma2',
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 16,
                  ),
                ],
              ),
              Text(
                'Consegnato il $deliveryDate',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'BalooTamma2',
                  color: Colors.grey.shade700,
                ),
              ),
              if (hasReview)
                InkWell(
                  onTap: () {
                    // Leave review logic
                  },
                  child: Text(
                    'Lascia una recensione',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'BalooTamma2',
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFFE2EDEE),
              ),
              const SizedBox(height: 18),
              CustomButton(
                text: 'Ordina di nuovo',
                textSize: 14,
                margin: 0,
                width: 160,
                onPressed: () {
                  // Reorder logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}