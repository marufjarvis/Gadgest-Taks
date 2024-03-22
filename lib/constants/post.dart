import 'dart:convert';

import 'package:apple_gadgets_task/constants/message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

dynamic postHttp(String path, dynamic body) async {
  Client client = Client();

  final response = await client.post(
    Uri.parse(path),
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json'},
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else if (response.statusCode == 401) {
    debugPrint(response.body);
    showErrorMessage("Wrong Credentials");
  } else {
    debugPrint(response.statusCode.toString());
    showErrorMessage("Something wrong wiht API");
    // Get.find<InitialController>().logOutUser();
    // Get.offAll(const LoginPage());
    // Get.snackbar("OPS", "Need To Logout",
    //     backgroundColor: AppTheme.redColor, colorText: AppTheme.whiteColor);

    throw Exception("API ERROR");
  }
}

dynamic getHttp(String path, String token) async {
  Client client = Client();

  final response = await client.get(
    Uri.parse(path),
    headers: {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    },
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    debugPrint(response.statusCode.toString());

    // Get.find<InitialController>().logOutUser();
    // Get.offAll(const LoginPage());
    // Get.snackbar("OPS", "Need To Logout",
    //     backgroundColor: AppTheme.redColor, colorText: AppTheme.whiteColor);

    throw Exception("API ERROR");
  }
}
