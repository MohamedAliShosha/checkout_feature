import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          clipBehavior: Clip.none,
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
              bottom: MediaQuery.sizeOf(context).height * .2 +
                  20, // bottom moves the circle up , 20 is the radius of the circle
              left: 20 + 8,
              right: 20 +
                  8, // 20 is the radius of the circle and 16 is the padding of the container
              child: Row(
                children: List.generate(
                  30,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Container(
                        height: 2,
                        color: const Color(0xffBBBBBB),
                      ),
                    ),
                  ),
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
            const Positioned(
              top: -50,
              left: 0, // Taking No space from the left
              right: 0, // Taking No space from the right
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffD9D9D9),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xff34AB53),
                  child: Icon(
                    Icons.check,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
