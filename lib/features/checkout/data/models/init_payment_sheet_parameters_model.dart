class InitPaymentSheetParametersModel {
  final String paymentIntentClientSecret;
  final String
      ephemeralKeySecret; // Required if you don't allow guests use the App
  final String customerId; // Required if you don't allow guests use the App

  InitPaymentSheetParametersModel({
    required this.paymentIntentClientSecret,
    required this.ephemeralKeySecret,
    required this.customerId,
  });
}
