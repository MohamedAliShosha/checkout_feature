import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentgateways_app/core/errors/failures.dart';
import 'package:paymentgateways_app/core/utils/stripe_service.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_parameters_model.dart';
import 'package:paymentgateways_app/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImplement implements CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentParametersModel
          paymentIntentParametersModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentParametersModel: paymentIntentParametersModel);
      return const Right(null); // as the payment is made successfully
    } on StripeException catch (e) {
      return Left(
        ServerFailure(
          e.error.message ?? 'Oops , something went wrong',
        ),
      ); // as the payment failed
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
