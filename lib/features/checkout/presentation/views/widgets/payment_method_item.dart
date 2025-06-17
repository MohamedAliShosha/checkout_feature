import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isActive,
  });

  final bool isActive; // To check if the item is active or not

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.50,
            color: isActive ? const Color(0xff34A853) : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/images/card.svg',
          height: 24,
        ),
      ),
    );
  }
}
