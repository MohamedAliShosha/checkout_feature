import 'package:flutter/material.dart';
import 'package:paymentgateways_app/core/utils/styles.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/card_info_widget.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // To take the available space
      decoration: ShapeDecoration(
        color: const Color(0xffD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 +
              16, // 50 is the radius of the circle , and 16 is tha actual padding between the circle and the text
          right: 22,
          left: 22,
        ),
        child: Column(
          children: [
            const Text(
              'Thank You',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(
              height: 42,
            ),
            const PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              title: 'Time',
              value: '10:15 AM',
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            const Divider(
              height: 60, // will be 30 from top and 30 from bottom
              thickness: 2, //
            ),
            const TotalPrice(
              title: 'Total',
              value: r'$50.97',
            ),
            const SizedBox(
              height: 30,
            ),
            const CardInfoWidget(),
          ],
        ),
      ),
    );
  }
}
