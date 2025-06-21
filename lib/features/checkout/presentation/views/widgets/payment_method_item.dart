import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isActive,
    required this.image,
  });

  final bool isActive; // To check if the item is active or not
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
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
          image,
          // fit: BoxFit
          //     .scaleDown, // Make the image able to be smaller than its normal size but cannot be bigger than its normal size(Even that I change the size of the image, it will not be bigger than its normal size)
        ),
      ),
    );
  }
}
