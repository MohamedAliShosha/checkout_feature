import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:paymentgateways_app/core/utils/api_keys.dart';
import 'package:paymentgateways_app/core/widgets/custom_button.dart';
import 'package:paymentgateways_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:paymentgateways_app/features/checkout/data/models/amount_model/details.dart';
import 'package:paymentgateways_app/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:paymentgateways_app/features/checkout/data/models/item_list_model/order_item_model.dart';
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

            var transactionsData = getTransactionData();

            executePayPalPayment(context, transactionsData);
          },
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }

  void executePayPalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(
      MaterialPageRoute(
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
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    /*
            - first I created an amountModel then I gave values to its attributes
            */
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: DetailsModel(
        shipping: '0',
        shippingDiscount: 0,
        subtotal: '100',
      ),
    );
    /*
              - Second I Created a list of orders each one of them is an OrderItemModel
            */
    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '4',
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '5',
        quantity: 12,
      ),
    ];
    /*
              - Third I created an ItemList of Type ItemListModel and this model holds all orders
             */
    var itemList = ItemListModel(orders: orders);

    return (
      amount: amount,
      itemList: itemList
    ); // This is a new data type called records
  }
}
