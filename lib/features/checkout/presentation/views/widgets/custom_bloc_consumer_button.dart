import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:paymentgateways_app/core/widgets/custom_button.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_parameters_model.dart';
import 'package:paymentgateways_app/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/thank_you_view.dart';

class CustomBlocConsumerButton extends StatelessWidget {
  const CustomBlocConsumerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          // pushReplacement is used to replace the current view with a new one
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text(state.errorMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntentParametersModel parametersModel =
            //     PaymentIntentParametersModel(
            //   amount: "1000",
            //   currency: 'USD',
            //   customerId: 'cus_SargprQjNL40Bo',
            // );
            // BlocProvider.of<PaymentCubit>(context).makePayment(
            //   paymentIntentParametersModel: parametersModel,
            // );
            Navigator.of(context).push(MaterialPageRoute(
              // PaypalCheckoutView is an InApp web view
              builder: (BuildContext context) => PaypalCheckoutView(
                sandboxMode: true, // true => Test Mode , false => Live Mode
                clientId: "YOUR CLIENT ID",
                secretKey: "YOUR SECRET KEY",
                // Transaction is a list that contains a map
                // These map has 3 keys "amount, currency and description"
                // Each key has a value
                transactions: const [
                  {
                    "amount": {
                      "total": "100",
                      "currency": "USD",
                      "details": {
                        "subtotal": "100",
                        "shipping": "0",
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    "item_list": {
                      "items": [
                        {
                          "name": "Apple",
                          "quantity": 4,
                          "price": '10',
                          "currency": "USD"
                        },
                        {
                          "name": "Pineapple",
                          "quantity": 5,
                          "price": '12',
                          "currency": "USD"
                        }
                      ],
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  log("onSuccess: $params");
                  Navigator.pop(context);
                },
                onError: (error) {
                  log("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                  Navigator.pop(context);
                },
              ),
            ));
          },
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }
}
