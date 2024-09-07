import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/pages/mode_view.dart';
import '../view/common/login.dart';

class SplashServices {
  Future<void> isLogIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('isLogin') != false) {
      Timer(const Duration(seconds: 3), () {
        String? type = sharedPreferences.getString('TYPE');
        if (type == '0') {
          Get.off(() => const ModeView());
        } else {
          Get.off(() => LogInView());
        }
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.off(() => LogInView());
      });
    }
  }
}
