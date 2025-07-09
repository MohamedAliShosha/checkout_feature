import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentgateways_app/core/utils/api_keys.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/my_cart_view.dart';

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckoutApp());
}

/* Steps to integrate Stripe:
 1.Create a method called "createPaymentIntent" that returns PaymentIntentModel and takes these params (amount , currency) and these params are encapsulated at "PaymentIntentParametersModel class"

 2. Create a method called "Init payment sheet" that initializes a payment sheet and takes this required parameter   (paymentIntentClientSecret) and This parameter is encapsulated at "InitPaymentSheetParametersMode" class
  This method requires all secret info about the user
 
 3. Present payment sheet
 ____________________________________________________________________

 Steps to attach a payment method to a customer:
 1. PaymentIntentModel create payment intent(amount, currency, customerId) => customer id is created while the user create an account then stored locally
 2. EphemeralKeyModel create an ephemeral key (customerId). // This method returns EphemeralKeyModel that Contains "ephemeralKeySecret" which will be used
 3. initPaymentSheet(merchantDisplayName, intentClientSecret, ephemeralKeySecret)
 4. present payment sheet()
*/
