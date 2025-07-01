import 'package:flutter/material.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key, required this.updatePaymentMethod});

  // second I created a function with the same clarification"تعريف" and took the same parameter
  // of the function I created at PaymentMethodsBottomSheet
  // So, this file "PaymentMethodsListView" function will be a reference to the function I created at PaymentMethodsBottomSheet
  // and will be called from there.
  final Function({required int index}) updatePaymentMethod;

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];

  int activeIndex =
      0; // Index of the active payment method its by default the first one

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: GestureDetector(
              onTap: () {
                activeIndex = index; // Update the active index
                setState(() {});
                widget.updatePaymentMethod(index: activeIndex);
              },
              child: PaymentMethodItem(
                image: paymentMethodsItems[index],
                isActive: activeIndex ==
                    index, // Check if the current index is equal to the active index
              ),
            ),
          );
        },
      ),
    );
  }
}
