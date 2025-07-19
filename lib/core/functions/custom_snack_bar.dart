import 'package:flutter/material.dart';

void customSnackBar(String message, BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: Text(message),
  );
  ScaffoldMessenger.of(context).showSnackBar(
    snackBar,
  );
}
