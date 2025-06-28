import 'package:flutter/material.dart';
import 'package:paymentgateways_app/core/widgets/custom_button.dart';
import 'package:paymentgateways_app/core/widgets/custom_divider.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Image.asset('assets/images/basket_image.png'),
          ),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: '\$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: '\$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: '\$8',
          ),
          const CustomDivider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const SizedBox(
            height: 3,
          ),
          const TotalPrice(
            title: 'Total',
            value: '\$50.97',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            title: 'Complete Payment',
            onTap: () {
              showBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (context) {
                  return const PaymentMethodsBottomSheet();
                },
              );
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
