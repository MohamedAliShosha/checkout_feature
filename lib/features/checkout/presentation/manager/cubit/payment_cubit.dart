import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_parameters_model.dart';
import 'package:paymentgateways_app/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());

  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentParametersModel
          paymentIntentParametersModel}) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentParametersModel: paymentIntentParametersModel);

    data.fold(
      (failure) {
        emit(
          PaymentFailure(failure.errorMessage),
        );
      },
      (success) {
        emit(
          PaymentSuccess(),
        );
      },
    );
  }

  // As it only one cubit we just override the onChange method instead of creating entire bloc observer
  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString()); // used to monitor the cubit changes then print them
    super.onChange(change);
  }
}
