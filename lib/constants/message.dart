import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErrorMessage(String message) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: Colors.red,
    title: "OPS",
    message: message,
    duration: const Duration(seconds: 3),
  ));
}

showSuccessMessage(String message) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: Colors.green,
    title: "Congress",
    message: message,
    duration: const Duration(seconds: 3),
  ));
}
