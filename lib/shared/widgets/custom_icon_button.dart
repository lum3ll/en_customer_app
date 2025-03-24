import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onPressed;
  final Color? color;

  const CustomIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        iconPath,
        width: 20,
        height: 20,
        color: color ?? AppColors.primary,
      ),
      onPressed: onPressed,
    );
  }
}