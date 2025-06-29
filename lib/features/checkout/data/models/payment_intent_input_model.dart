class PaymentIntentParametersModel {
  final String amount;
  final String currency;

  PaymentIntentParametersModel({required this.amount, required this.currency});

  // This method is used to convert the object to a map that can be sent to the API
  // As the createPaymentIntent method type is a post request that accepts a json body
  convertParametersToJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}
