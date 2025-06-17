import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.thickness,
    required this.height,
    required this.color,
  });

  final double thickness;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness, // used to make the divider thicker
      height: height,
      color: color,
    );
  }
}
