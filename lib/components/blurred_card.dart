import 'package:flutter/material.dart';
import 'dart:ui';


class BlurredCard extends StatelessWidget {
  const BlurredCard({super.key, required this.tHeight, required this.tWidth, required this.tChild});

  final double tWidth;
  final double tHeight;
  final tChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: tWidth,
        height: tHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(filter: ImageFilter.blur(
              sigmaX: 1.0,
              sigmaY: 1.0,

            ),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all( color: Colors.white.withOpacity(0.28)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            Center(child: tChild),
          ],
        ),
      ),
    );
  }
}







