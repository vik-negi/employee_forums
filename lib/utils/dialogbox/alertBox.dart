import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomAlertBox(BuildContext context, String title, String message,
    Function()? onPressedOk) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("No")),
          TextButton(onPressed: onPressedOk, child: const Text("Yes")),
        ],
      );
    },
  );
}
