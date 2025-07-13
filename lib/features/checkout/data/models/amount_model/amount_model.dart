import 'details.dart';

class AmountModel {
  final String? total;
  final String? currency;
  final DetailsModel? details;

  AmountModel(
      {required this.total, required this.currency, required this.details});

  factory AmountModel.fromJson(Map<String, dynamic> json) => AmountModel(
        total: json['total'] as String?,
        currency: json['currency'] as String?,
        details: json['details'] == null
            ? null
            : DetailsModel.fromJson(json['details'] as Map<String, dynamic>),
      );

  /*
    This function converts the AmountModel instance into a JSON-compatible Map<String, dynamic>.
    It creates a map with keys 'total', 'currency', and 'details'.
    The values for 'total' and 'currency' are the corresponding fields of the object.
    For 'details', it calls toJson() on the details object if it is not null, otherwise it sets it to null.
    This is typically used to serialize the object for sending over a network or saving to storage.
   */
  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}
