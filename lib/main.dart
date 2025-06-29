import 'package:flutter/material.dart';
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
  runApp(const CheckoutApp());
}

// Steps to integrate Stripe:
// 1. PaymentIntentObject Create a payment intent(amount , currency)
// 2. Init payment sheet (paymentIntentClientSecret)
// 3. Present payment sheet
