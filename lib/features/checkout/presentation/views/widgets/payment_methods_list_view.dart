import 'package:flutter/material.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/payment_method_item.dart';

// The StatefulWidget class
class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key, required this.updatePaymentMethod});

  /*
    Step7: Creating a function with the same name "updatePaymentMethod"
   */
  final Function({required int index})
      updatePaymentMethod; // This method is a reference for the updatePaymentMethod in Payment_Methods_Bottom_Sheet file "so it must have the same declaring with the same parameters" thats means calling updatePaymentMethod of this file will call updatePaymentMethod of Payment_Methods_Bottom_Sheet

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
              // This is the place that is responsible for changing paypal value too
              onTap: () {
                activeIndex = index; // Update the active index
                setState(() {});
                // Step9: Calling the updatePaymentMethod function
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
