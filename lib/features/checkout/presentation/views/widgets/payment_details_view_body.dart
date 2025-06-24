import 'package:flutter/material.dart';
import 'package:paymentgateways_app/core/widgets/custom_button.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode =
      AutovalidateMode.disabled; // To disable auto validation in the beginning
  /*
  You are using autovalidateMode inside CustomCreditCard only as a medium
  to pass it to CreditCardForm, 
  which is actually the component responsible for validating the form fields.
 
*/

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverToBoxAdapter enables me to use expanded widget
        const SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autovalidateMode: autoValidateMode,
            formKey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody:
              false, // Because the custom Button will fill all the remaining space, making this value equal to false prevent him from scrolling.

          // The align widget will take all the remaining space and align the button in a part of the remaining space so the button will not expand to the bottom of the screen
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 12,
              ),
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save(); //
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const ThankYouView();
                        },
                      ),
                    );
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: 'Payment',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
