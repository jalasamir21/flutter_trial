import 'package:flutter/material.dart';

class GradientColor extends StatelessWidget {
  // Method to return the gradient
  static LinearGradient getGradient() {
    return const LinearGradient(
      colors: [
        Color(0xFF180D41), // Top Color
        Color(0xFF350D53), // Second Color
        Color(0xFF190E43), // Third Color
        Color(0xFF130736), // Bottom Color
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.1, 0.5, 0.8, 1.0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: getGradient(),
      ),
    );
  }
}