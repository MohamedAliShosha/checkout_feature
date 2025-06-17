import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.50,
            color: Color(0xff34A853),
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
