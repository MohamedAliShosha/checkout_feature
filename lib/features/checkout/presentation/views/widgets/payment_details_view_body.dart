import 'package:flutter/material.dart';
import 'package:paymentgateways_app/core/widgets/custom_button.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        // SliverToBoxAdapter enables me to use expanded widget
        SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(),
        ),
        SliverFillRemaining(
          hasScrollBody:
              false, // Because the custom Button will fill all the remaining space, making this value equal to false prevent him from scrolling.

          // The align widget will take all the remaining space and align the button in a part of the remaining space so the button will not expand to the bottom of the screen
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 12,
              ),
              child: CustomButton(),
            ),
          ),
        ),
      ],
    );
  }
}
