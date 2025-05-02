import 'package:eneed_cust_app/features/cart/screens/cart_screen.dart';
import 'package:eneed_cust_app/features/home/screens/home_screen.dart';
import 'package:eneed_cust_app/features/order/screens/order_list_screen.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.0),  // Completely transparent at top
            Colors.white.withOpacity(0.5),  // Semi-transparent in middle
            Colors.white,                   // Solid white at bottom
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavBarItem(
                imagePath: 'assets/images/navbar/home_icon.png',
                isSelected: selectedIndex == 0,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              ),
              _NavBarItem(
                imagePath: 'assets/images/navbar/search_icon.png',
                isSelected: selectedIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavBarItem(
                imagePath: 'assets/images/navbar/orders_icon.png',
                isSelected: selectedIndex == 2,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderListScreen()),
                ),
              ),
              _NavBarItem(
                imagePath: 'assets/images/navbar/fav_icon.png',
                isSelected: selectedIndex == 3,
                onTap: () => onTap(3),
              ),
              _NavBarItem(
                imagePath: 'assets/images/navbar/cart_icon.png',
                isSelected: selectedIndex == 4,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                ),
              ),
              _NavBarItem(
                imagePath: 'assets/images/navbar/support_icon.png',
                isSelected: selectedIndex == 5,
                onTap: () => onTap(5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Image.asset(
          imagePath,
          width: 28,
          height: 28,
          color: isSelected ? AppColors.primary : Colors.grey,
        ),
      ),
    );
  }
}
