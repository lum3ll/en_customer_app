import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double textSize;
  final double margin;
  final Color? borderColor;
  final double borderWidth;
  final double? width;
  final double height;

  const CustomButton({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.textSize = 16,
    this.margin = 24,
    this.borderColor,
    this.borderWidth = 0,
    this.width,
    this.height = 56,
  }) : assert(text != null || child != null, 'Either text or child must be provided');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: textColor ?? Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth,
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: textColor ?? Colors.white,
                  strokeWidth: 2,
                ),
              )
            : child ??
                Text(
                  text!,
                  style: TextStyle(
                    fontFamily: 'BalooTamma2',
                    fontSize: textSize,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: textColor ?? Colors.white,
                  ),
                ),
      ),
    );
  }
}
