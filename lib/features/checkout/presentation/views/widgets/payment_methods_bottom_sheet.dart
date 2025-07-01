import 'package:flutter/material.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/custom_bloc_consumer_button.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPayPal = false; // Because another card is selected by default

  // first I created a function to update the payment method
  //// Then I passed it to the PaymentMethodsListView
  // I passed an Entire function to the PaymentMethodsListView
  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPayPal = false;
    } else {
      isPayPal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(
            updatePaymentMethod: updatePaymentMethod,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomBlocConsumerButton(
            isPayPal: isPayPal,
          ),
        ],
      ),
    );
  }
}
