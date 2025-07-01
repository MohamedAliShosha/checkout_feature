import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:paymentgateways_app/core/utils/api_keys.dart';
import 'package:paymentgateways_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:paymentgateways_app/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/my_cart_view.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/thank_you_view.dart';

void executePayPalPayment(BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionsData) {
  Navigator.of(context).push(MaterialPageRoute(
    // PaypalCheckoutView is an InApp web view
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true, // true => Test Mode , false => Live Mode
      clientId: ApiKeys.payPalClientId,
      secretKey: ApiKeys.payPalSecretKey,
      // Transaction is a list that contains a map
      // These map has 3 keys "amount, currency and description"
      // Each key has a value
      transactions: [
        {
          "amount": transactionsData.amount.toJson(),
          "description": "The payment transaction description.",
          "item_list": transactionsData.itemList.toJson(),
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        // Push to Thank you page and remove all
        // other views from the stack so, If I try
        // to go back, it will quit the app
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ThankYouView(),
          ),
          (route) {
            if (route.settings.name == '/') {
              return true; // Keep home view "Don't delete it" => '/' refers to home view
            } else {
              return false; // Delete all other views
            }
          },
        );
      },
      onError: (error) {
        SnackBar snackBar = SnackBar(
          content: Text(error.toString()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar,
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MyCartView(),
            ), (route) {
          return false; // Delete all other views
        });
      },
      onCancel: () {
        print('cancelled:');
        Navigator.pop(context);
      },
    ),
  ));
}
