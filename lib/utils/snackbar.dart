import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(BuildContext context, String message, bool isError,
    {bool directionUp = false}) {
  Get.rawSnackbar(
    message: message,
    backgroundColor: isError ? Theme.of(context).errorColor : Colors.green,
    snackStyle: SnackStyle.FLOATING,
    snackPosition: directionUp ? SnackPosition.TOP : SnackPosition.BOTTOM,
    icon: const Icon(Icons.error, color: Colors.white),
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
  );
}
