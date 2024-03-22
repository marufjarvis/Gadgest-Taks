// To parse this JSON data, do
//
//     final loginRequstModel = loginRequstModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginRequstModel loginRequstModelFromJson(String str) =>
    LoginRequstModel.fromJson(json.decode(str));

String loginRequstModelToJson(LoginRequstModel data) =>
    json.encode(data.toJson());

class LoginRequstModel {
  final String email;
  final String password;
  final String deviceName;

  LoginRequstModel({
    required this.email,
    required this.password,
    required this.deviceName,
  });

  factory LoginRequstModel.fromJson(Map<String, dynamic> json) =>
      LoginRequstModel(
        email: json["email"],
        password: json["password"],
        deviceName: json["device_name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_name": deviceName,
      };
}
