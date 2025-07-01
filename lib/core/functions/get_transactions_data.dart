import 'package:paymentgateways_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:paymentgateways_app/features/checkout/data/models/amount_model/details.dart';
import 'package:paymentgateways_app/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:paymentgateways_app/features/checkout/data/models/item_list_model/order_item_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransactionData() {
  /*
            - first I created an amountModel then I gave values to its attributes
            */
  var amount = AmountModel(
    total: '100', // should equals (shipping + subtotal - shipping_discount)
    currency: 'USD',
    details: DetailsModel(
      shipping: '0',
      shippingDiscount: 0, // Not a percentage just a number to be deducted 5$
      subtotal: '100',
    ),
  );
  /*
              - Second I Created a list of orders each one of them is an OrderItemModel
            */
  // The items price Sum should equals the subtotal
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
