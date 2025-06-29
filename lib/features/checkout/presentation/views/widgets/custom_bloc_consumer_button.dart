import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentgateways_app/core/widgets/custom_button.dart';
import 'package:paymentgateways_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:paymentgateways_app/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:paymentgateways_app/features/checkout/presentation/views/thank_you_view.dart';

class CustomBlocConsumerButton extends StatelessWidget {
  const CustomBlocConsumerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          // pushReplacement is used to replace the current view with a new one
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        }
        if (state is PaymentFailure) {
          SnackBar snackBar = SnackBar(
            content: Text(state.errorMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentParametersModel parametersModel =
                PaymentIntentParametersModel(
              amount: "1000",
              currency: 'USD',
            );
            BlocProvider.of<PaymentCubit>(context).makePayment(
              paymentIntentParametersModel: parametersModel,
            );
          },
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }
}
