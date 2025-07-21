import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color labelColor;
  const CustomText({
    super.key,
    required this.label,
    this.fontSize = 18,
    this.labelColor = Colors.white,
    required FontWeight fontWeight,
    required FontStyle fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: labelColor, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
