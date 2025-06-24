import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Stack(
        children: [
          Container(
            decoration: ShapeDecoration(
              color: const Color(0xffD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
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
        ],
      ),
    );
  }
}
