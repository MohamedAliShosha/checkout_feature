import 'package:flutter/material.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/custom_dashed_line.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 +
                20, // bottom moves the circle up , 20 is the radius of the circle
            left: 20 + 8,
            right: 20 +
                8, // 20 is the radius of the circle and 16 is the padding of the container
            child: const CustomDashedLine(),
          ),
          Positioned(
            left:
                -20, // having a negative value moves the circle to the outside direction from the left
            bottom: MediaQuery.sizeOf(context).height *
                .2, // bottom moves the circle up
            child: const CircleAvatar(
              // the default radius of circle avatar is 20
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right:
                -20, // having a negative value moves the circle to the outside direction from the left
            bottom: MediaQuery.sizeOf(context).height *
                .2, // bottom moves the circle up
            child: const CircleAvatar(
              // the default radius of circle avatar is 20
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            top: -50,
            left: 0, // Taking No space from the left
            right: 0, // Taking No space from the right
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
