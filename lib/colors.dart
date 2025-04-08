import 'package:flutter/material.dart';

class AppColors {
  static const LinearGradient grayButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    colors: [
      Color(0xFF2A303E),
      Color(0xFF393E51),
    ],
  );

  static const LinearGradient grayButtonOut = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x3FFFFFFF),
      Color(0x41000000)
    ]
  );

  static const LinearGradient orangeButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFDD732F),
      Color(0xFFE28D21),
    ],
  );

  static const LinearGradient lightGrayButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF465262),
      Color(0xFF626B7C),
    ],
  );

  static const Color backgroundColor = Color(0xFF222630);
}
