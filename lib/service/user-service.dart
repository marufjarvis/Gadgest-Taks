import 'package:apple_gadgets_task/constants/post.dart';
import 'package:apple_gadgets_task/constants/string.dart';
import 'package:apple_gadgets_task/model/login-request-model.dart';
import 'package:apple_gadgets_task/model/login-response-model.dart';
import 'package:apple_gadgets_task/model/profile-response-model.dart';
import 'package:hive/hive.dart';

class UserService {
  static Future<LoginResponseModel> userLogin(LoginRequstModel body) async {
    var jsonReponse = await postHttp(AppString.baseUrl + AppString.login, body);
    print(jsonReponse);
    LoginResponseModel response = LoginResponseModel.fromJson(jsonReponse);
    var box = Hive.box('tasks');
    box.put("token", response.token);
    return response;
  }

  static Future<ProfileResponseModel> getUserProfileData() async {
    var box = Hive.box('tasks');
    var token = box.get("token");
    print(token);
    var jsonReponse =
        await getHttp(AppString.baseUrl + AppString.profle, token);
    ProfileResponseModel response = ProfileResponseModel.fromJson(jsonReponse);
    return response;
  }

  static Future<ProfileResponseModel> updateUserProfileData() async {
    var box = Hive.box('tasks');
    var token = box.get("token");
    print(token);
    var jsonReponse =
        await getHttp(AppString.baseUrl + AppString.profle, token);
    ProfileResponseModel response = ProfileResponseModel.fromJson(jsonReponse);
    return response;
  }
}
