import 'package:apple_gadgets_task/binding/user-binding.dart';
import 'package:apple_gadgets_task/view/login/login-page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appDocumentDirectory =
  //     await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  // await Hive.openBox('myBox');
  await Hive.initFlutter();
  await Hive.openBox('tasks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: UserBinding(),
      title: 'Gadgets Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// firebase_core: ^1.10.6
//   firebase_messaging: ^11.3.0
//   flutter_local_notifications: ^9.2.0
// import 'package:firebase_messaging/firebase_messaging.dart';

// class FirebaseMessagingService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> setupFirebase() async {
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       provisional: false,
//       sound: true,
//     );

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       // Handle foreground messages
//       print("onMessage: $message");
//       // You can show a local notification here
//     });

//     FirebaseMessaging.onLaunch.listen((RemoteMessage message) {
//       // Handle launch
//       print("onLaunch: $message");
//     });

//     FirebaseMessaging.onResume.listen((RemoteMessage message) {
//       // Handle resume
//       print("onResume: $message");
//     });
//   }
// }

// ///////////////////////!SECTION
// ///void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessagingService().setupFirebase();

//   runApp(MyApp());
// }
// ////////////
// ///
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // ...

// onMessage: (RemoteMessage message) async {
//   print("onMessage: $message");

//   // Show a local notification
//   await _showLocalNotification(message.notification?.title, message.notification?.body);
// }

// Future<void> _showLocalNotification(String? title, String? body) async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'your_channel_id',
//     'your_channel_name',
//     'your_channel_description',
//     importance: Importance.max,
//     priority: Priority.high,
//   );

//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   await FlutterLocalNotificationsPlugin().show(
//     0,
//     title ?? '',
//     body ?? '',
//     platformChannelSpecifics,
//     payload: 'item x',
//   );
// }

// ignore_for_file: avoid_print, nullable_type_in_catch_clause, prefer_typing_uninitialized_variables

// import 'dart:convert';
// import 'dart:io';

// import 'package:abs_xpress_app/constants/color/app_color.dart';
// import 'package:abs_xpress_app/constants/string/app_string.dart';
// import 'package:abs_xpress_app/constants/string/routes_string.dart';
// import 'package:abs_xpress_app/controller/home_controller/home_controller.dart';
// import 'package:abs_xpress_app/model/error_handler_model/error_model.dart';
// import 'package:abs_xpress_app/model/user_related_model/edit_profile_mode.dart';
// import 'package:abs_xpress_app/view/widgets/snackbar_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// //import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';

// //FlutterSecureStorage storage = FlutterSecureStorage();
// HomeController homeController = Get.put(HomeController());

// class EditProfileService {
//   static var client = http.Client();

//   Future<EditProfileModel> editProifleNow(
//       EditProfileModel userData, BuildContext context) async {
//     print('Starting edit profile');
//     print(homeController.userToken);

//     //header
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer ${homeController.userToken}',
//     };
//     //request

//     final requesttoEditProfiel = jsonEncode(userData.toJson());
//     print(requesttoEditProfiel);

//     var res;

//     try {
//       res = await http.post(Uri.parse('${AppString.baseUrl}/api/profle/'),
//           headers: headers, body: requesttoEditProfiel);
//     } on SocketException catch (e) {
//       snackBarInfo('No Internet Connection', AppColor.redColor, context);
//       print("Network Error");
//       print(e);
//     }

//     print(res.statusCode);

//     if (res.statusCode == 201) {
//       print(res.body);
//       var response = EditProfileModel.fromJson(res.body);
//       print(response.phoneNo);
//       return response;
//     } else {
//       String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;

//       if (msg.contains("JWT")) {
//         await storage.deleteAll();
//         warningToast(AppColor.redColor, 'Please Login your account now');
//         print("Please Logout or Restart your application");
//         Get.offAllNamed(RouteString.registationRoute);
//       }
//       throw Exception('Not Created');
//     }
//   }
// }

//   uploadImage(File file) async {
//     Map<String, String> headers = {
//       'Content-Type': 'multipart/form-data',
//       'Authorization':
//           'Bearer ${(await storage.read(key: StorageString.userToken))!}',
//     };
//     http.MultipartRequest request = http.MultipartRequest(
//         "POST", Uri.parse("${AppString.baseUrl}/api/profle/profileImage"));
//     request.headers.addAll(
//       headers,
//     );
//     http.MultipartFile multipartFile =
//         await http.MultipartFile.fromPath('image', file.path);

//     request.files.add(multipartFile);

//     http.StreamedResponse response = await request.send();

//     print(response.statusCode);
//   }
// }