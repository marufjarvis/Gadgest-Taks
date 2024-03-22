import 'package:apple_gadgets_task/controller/user-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<UserController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Obx(() {
              return controller.isLoading.isFalse
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            controller.user.value.coverImage != null
                                ? Image.network(
                                    controller.user.value.profileImage,
                                    width: 100,
                                    fit: BoxFit.contain,
                                    height: 100,
                                  )
                                : Image.asset(
                                    'assets/images/cover.jpeg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                            Positioned(
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
                                  child: controller.user.value.profileImage !=
                                          null
                                      ? Image.network(
                                          controller.user.value.profileImage,
                                          width: 100,
                                          fit: BoxFit.contain,
                                          height: 100,
                                        )
                                      : Image.asset(
                                          'assets/images/profile.jpeg',
                                          width: 100,
                                          fit: BoxFit.contain,
                                          height: 100,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${controller.user.value.firstName} ${controller.user.value.lastName}",
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(
                          controller.user.value.dob ?? "DOB:0",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
          ),
        ));
  }
}
