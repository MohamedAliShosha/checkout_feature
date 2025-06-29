import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentgateways_app/core/utils/api_keys.dart';
import 'package:paymentgateways_app/core/utils/api_services.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentParametersModel paymentIntentParametersModel) async {
    var response = await apiService.post(
        body: paymentIntentParametersModel.convertParametersToJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);

    var paymentIntentModel = PaymentIntentModel.fromJson(response);
    return paymentIntentModel;

    /* The post request returns response.data that I have assigned it to the response variable so I don't need to use response.data again here
    */
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Mohamed',
      ),
    );
  }
}
