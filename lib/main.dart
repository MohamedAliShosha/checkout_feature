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
