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
 1. PaymentIntentModel Create a payment intent(amount , currency)
 2. Init payment sheet (paymentIntentClientSecret)
 3. Present payment sheet
 ____________________________________________________________________

 Steps to attach a payment method to a customer:
 1. PaymentIntentModel create payment intent(amount, currency, customerId) => customer id can be is created while the user create an account then stored locally
 2. keySecret create an ephemeral key (customerId)
 3. initPaymentSheet(merchantDisplayName, intentClientSecret, ephemeralKeySecret)
 4. present payment sheet()
*/
