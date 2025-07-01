import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_parameters_model.dart';
import 'package:paymentgateways_app/features/checkout/presentation/manager/cubit/payment_cubit.dart';

void executeStripePayment(BuildContext context) {
  PaymentIntentParametersModel parametersModel = PaymentIntentParametersModel(
    amount: "1000",
    currency: 'USD',
    customerId: 'cus_SargprQjNL40Bo',
  );
  BlocProvider.of<PaymentCubit>(context).makePayment(
    paymentIntentParametersModel: parametersModel,
  );
}
