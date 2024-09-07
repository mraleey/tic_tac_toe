// data/helper/dependencies.dart
import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/log_in_controller.dart';
import '../../repository/login_repository.dart';
import '../api/api_client.dart';
import '../app_urls.dart';

Future<void> init() async {
  // SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences);

  // ApiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppUrls.baseUrl));
  Get.put(
      LoginRepository(apiClient: Get.find(), sharedPreferences: Get.find()));

  // Repositories

  // Controllers
  Get.put(LoginController(loginRepository: Get.find()));
}
