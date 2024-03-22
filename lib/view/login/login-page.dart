import 'package:apple_gadgets_task/constants/message.dart';
import 'package:apple_gadgets_task/controller/user-controller.dart';
import 'package:apple_gadgets_task/model/login-request-model.dart';
import 'package:apple_gadgets_task/view/profile/profile-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<UserController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              decoration: const BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
            //input taken : loign and password
            const InfoArea()
          ],
        ),
      ),
    );
  }
}

class InfoArea extends StatelessWidget {
  const InfoArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20, right: 20, top: MediaQuery.of(context).size.height * 0.1),
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In",
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sign in to discover amazing things",
            ),
            SizedBox(
              height: 70,
            ),
            //textfield
            TextFieldArea(),

            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.center,
                child: Text("Not Have an Account Yet? Click"))
          ],
        ),
      ),
    );
  }
}

class TextFieldArea extends GetView<UserController> {
  const TextFieldArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          TextField(
            controller: controller.emailTFcontroller,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.passwordTFcontroller,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(() {
            return controller.isLoading.isFalse
                ? MaterialButton(
                    color: Colors.white,
                    onPressed: () async {
                      if (controller.emailTFcontroller.text.isNotEmpty &&
                          controller.passwordTFcontroller.text.isNotEmpty) {
                        if (controller.passwordTFcontroller.text.length < 6) {
                          //errror
                          showErrorMessage("Invalid Password Lenght");
                        } else if (!controller.emailTFcontroller.text.isEmail) {
                          //invalid email
                          showErrorMessage("Invalid Email");
                        } else {
                          var isLogin = await controller.doUserLogin(
                              LoginRequstModel(
                                  email: controller.emailTFcontroller.text,
                                  password:
                                      controller.passwordTFcontroller.text,
                                  deviceName: "mobile"));

                          if (isLogin) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => ProfilePage()));
                          }
                        }
                      } else {
                        showErrorMessage("Field cannot be empty");
                      }
                    },
                    child: const Text("Login"))
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.indigo,
                    ),
                  );
          })
        ],
      ),
    );
  }
}
