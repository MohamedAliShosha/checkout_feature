class InitPaymentSheetParametersModel {
  final String paymentIntentClientSecret;
  final String ephemeralKeySecret;
  final String customerId;

  InitPaymentSheetParametersModel(
      {required this.paymentIntentClientSecret,
      required this.ephemeralKeySecret,
      required this.customerId});
}
