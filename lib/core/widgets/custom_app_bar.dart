import 'package:flutter/material.dart';
import 'package:paymentgateways_app/core/utils/styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: const Icon(
      Icons.arrow_back,
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
