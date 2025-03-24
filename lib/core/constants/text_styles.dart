import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: 'BalooTamma2',
    letterSpacing: 0.6,
    color: Colors.black,
    height: 0.8,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontFamily: 'BalooTamma2',
    color: AppColors.descriptionText,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'BalooTamma2',
    letterSpacing: 1,
  );

  static const TextStyle inputText = TextStyle(
    fontSize: 16,
    fontFamily: 'BalooTamma2',
    color: Colors.black,
  );

  static const TextStyle inputHint = TextStyle(
    color: Colors.grey,
    fontFamily: 'BalooTamma2',
  );
}
