import 'order_item_model.dart';

class ItemListModel {
  List<OrderItemModel>? orders; // first we need to create a list of <OrderItemModel>  then store them at ItemListModel 

  ItemListModel({this.orders});

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
        orders: (json['items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': orders?.map((e) => e.toJson()).toList(),
      };
}
