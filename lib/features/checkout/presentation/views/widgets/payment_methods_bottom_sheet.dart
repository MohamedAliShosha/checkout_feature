import 'package:flutter/material.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/custom_bloc_consumer_button.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  // Step3: converted the widget to a stateful widget

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPayPal =
      false; // Step4: The default value is false Because another card is selected by default when opening the bottom sheet

  /* Step6: I created a function to update the payment method
      Now I need to call this method inside the GestureDetector of PaymentMethodsListView that is responsible for selecting the payment method
      Then I passed it to the PaymentMethodsListView
      I passed an Entire function to the PaymentMethodsListView
  */
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
          // PaymentMethodsListView is the place where the user selects the payment method that will be used
          // Step8: passing the updatePaymentMethod function that I have created above to PaymentMethodsListView() but with removing brackets()
          // Using brackets means that calling the method not passing it and calling the updatePaymentMethod requires an index parameter which I don't have a value for it here
          PaymentMethodsListView(
            updatePaymentMethod: updatePaymentMethod,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomBlocConsumerButton(
            isPayPal:
                isPayPal, // Step5: Passing the paypal value here => Now by default Stripe is used
          ),
        ],
      ),
    );
  }
}
