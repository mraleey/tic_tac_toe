import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api_client.dart';
import '../data/app_urls.dart';

class LoginRepository extends GetxService {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;

  LoginRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> getLoginData() async {
    return await apiClient.getData(AppUrls.loginUrl);
  }

  Future<Response> postLoginData(dynamic body) async {
    return await apiClient.postData(AppUrls.loginUrl, body);
  }

  Future<void> saveLoginInfo(String username, password) async {
    try {
      await sharedPreferences.setString("username", username);
      await sharedPreferences.setString("password", password);
    } catch (e) {
      Get.snackbar("Error", "Error saving login info");
    }
  }

  Future<void> isLogin(bool isLogin) async {
    try {
      await sharedPreferences.setBool("isLogin", isLogin);
    } catch (e) {
      Get.snackbar("Error", "Error saving login info");
    }
  }

  Future<void> clearUserInfo() async {
    try {
      await sharedPreferences.remove('username');
      await sharedPreferences.remove('password');
      await sharedPreferences.setBool('isLogin', false);
    } catch (e) {
      Get.snackbar("Error", "Error clearing login info");
    }
  }
}
