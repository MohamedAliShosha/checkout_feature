import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentgateways_app/core/utils/api_keys.dart';
import 'package:paymentgateways_app/core/utils/api_services.dart';
import 'package:paymentgateways_app/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:paymentgateways_app/features/checkout/data/models/init_Payment_Sheet_Parameters_Model.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_parameters_model.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentParametersModel paymentIntentParametersModel) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        body: paymentIntentParametersModel.convertParametersToJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);

    var paymentIntentModel = PaymentIntentModel.fromJson(response);
    return paymentIntentModel;

    /* The post request returns response.data that I have assigned it to the response variable so I don't need to use response.data again here
    */
  }

  Future initPaymentSheet(
      {required InitPaymentSheetParametersModel
          initPaymentSheetParametersModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initPaymentSheetParametersModel.paymentIntentClientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetParametersModel.ephemeralKeySecret,
        merchantDisplayName: 'Mohamed',
        customerId: initPaymentSheetParametersModel.customerId,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentParametersModel
          paymentIntentParametersModel}) async {
    var paymentIntentModel =
        await createPaymentIntent(paymentIntentParametersModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentParametersModel.customerId);
    var initPaymentSheetModel = InitPaymentSheetParametersModel(
      ephemeralKeySecret: ephemeralKeyModel.secret!,
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentParametersModel.customerId,
    );
    await initPaymentSheet(
        initPaymentSheetParametersModel: initPaymentSheetModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2022-08-01'
        },
        contentType: Headers.formUrlEncodedContentType,
        body: {
          'customer': customerId,
        },
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey);

    var ephemeralKey = EphemeralKeyModel.fromJson(response);
    return ephemeralKey;

    /* The post request returns response.data that I have assigned it to the response variable so I don't need to use response.data again here
    */
  }
}
