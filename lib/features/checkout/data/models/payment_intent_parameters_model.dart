class PaymentIntentParametersModel {
  final String amount;
  final String currency;
  final String
      customerId; // May be not required if the app accepts guests without creating an account

  PaymentIntentParametersModel(
      {required this.amount, required this.customerId, required this.currency});

  // This method is used to convert the object to a map that can be sent to the API
  // As the createPaymentIntent method type is a post request that accepts a json body
  convertParametersToJson() {
    return {
      'amount':
          "${amount}00", // we added 2 zeros"*100" to the amount because the number will be divided by 100
      'currency': currency,
      'customer': customerId,
    };
  }
}
