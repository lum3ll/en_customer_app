import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF2FCFD) : Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF00B2C5) : const Color(0xFFE2EDEE),
              width: isSelected ? 3 : 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primary : Colors.grey,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
              fontFamily: 'BalooTamma2'
            ),
          ),
        ),
      ),
    );
  }
}