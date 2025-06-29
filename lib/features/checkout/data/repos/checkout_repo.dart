import 'package:dartz/dartz.dart';
import 'package:paymentgateways_app/core/errors/failures.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentParametersModel paymentIntentParametersModel});
}
