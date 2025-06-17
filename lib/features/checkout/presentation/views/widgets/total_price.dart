import 'package:flutter/material.dart';
import 'package:paymentgateways_app/core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style22,
        ),
        const Spacer(),
        Text(
          value,
          style: Styles.style22,
        ),
      ],
    );
  }
}
