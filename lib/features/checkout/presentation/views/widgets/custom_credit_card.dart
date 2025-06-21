import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber =
      ''; // these variables must have initial values, In the beginning they are empty
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          isHolderNameVisible: true, // show the name of the card holder
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange:
              (CreditCardModel) // CreditCardModel includes all data I concern about then through the model I can access data comes from the form then assigning them to the variables I have created above then making rebuild to display the new data
              {
            cardHolderName = CreditCardModel.cardHolderName;
            cardNumber = CreditCardModel.cardNumber;
            expiryDate = CreditCardModel.expiryDate;
            cvvCode = CreditCardModel.cvvCode;
            showBackView = CreditCardModel
                .isCvvFocused; // show back side when pressing on the cvv field to enter it.
            setState(() {});
          },
          formKey: formKey,
        ),
      ],
    );
  }
}
