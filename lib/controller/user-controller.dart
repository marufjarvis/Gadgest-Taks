// ignore_for_file: avoid_print

import 'dart:io';

import 'package:apple_gadgets_task/constants/message.dart';
import 'package:apple_gadgets_task/model/login-request-model.dart';
import 'package:apple_gadgets_task/model/login-response-model.dart';
import 'package:apple_gadgets_task/model/profile-response-model.dart';
import 'package:apple_gadgets_task/service/user-service.dart';
import 'package:apple_gadgets_task/view/profile/profile-page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var user = ProfileResponseModel(
          id: 0,
          title: "",
          firstName: "",
          lastName: "",
          companyName: "",
          dob: "",
          vatNo: 0,
          accessType: 0,
          meta: 0,
          points: 0,
          createdAt: DateTime(2024),
          updatedAt: DateTime(2024),
          profileImage: "",
          coverImage: "")
      .obs;
  var emailTFcontroller =
      TextEditingController(text: "ashrafultuhin.agl@gmail.com");
  var passwordTFcontroller = TextEditingController(text: "Googleandfacebook1");
  Future<bool> doUserLogin(LoginRequstModel body) async {
    isLoading(true);
    try {
      LoginResponseModel user = await UserService.userLogin(body);
      if (user.success) {
        print("logedin");
        showSuccessMessage("User Successfully Login");
        getUserPorifle();
      }
      isLoading(false);
      return true;
    } on SocketException {
      print("no internet");
      showErrorMessage("No internet connection");
      isLoading(false);
      return false;
    } catch (e) {
      isLoading(false);
      return false;
    }
  }

  void getUserPorifle() async {
    isLoading(true);
    try {
      ProfileResponseModel data = await UserService.getUserProfileData();
      user.value = data;
      print(data.firstName);
      isLoading(false);
    } on SocketException {
      print("no internet");
      showErrorMessage("No internet connection");
      isLoading(false);
    } catch (e) {
      print(e);
      isLoading(false);
    }
  }
}
