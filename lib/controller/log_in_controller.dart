import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/view/pages/mode_view.dart';

import '../res/components/app_colors.dart';
import '../repository/login_repository.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final RxBool isPasswordVisible = true.obs;
  final RxBool isLoading = false.obs;

  final RxBool rememberMe = false.obs;

  final LoginRepository loginRepository;
  LoginController({required this.loginRepository});

  Future<bool> postLoginData(dynamic data) async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      _showSnackbar("Error", "Please fill all fields", kPrimaryRed);
      return false;
    }

    try {
      toggleLoading();
      Response response = await loginRepository.postLoginData(data);
      if (response.statusCode == 200) {
        return _handleSuccessfulLogin(response.body);
      } else {
        _showInvalidCredentialsError();
        return false;
      }
    } catch (e) {
      _showInvalidCredentialsError();
      return false;
    } finally {
      toggleLoading();
    }
  }

  Future<bool> _handleSuccessfulLogin(String responseBody) async {
    List<dynamic> users = jsonDecode(responseBody);
    if (users.isEmpty) {
      _showInvalidCredentialsError();
      return false;
    }

    var user = users[0];
    await _saveUserInfo(user);
    if (user['TYPE'] == 0) {
      Get.to(const ModeView());
      _showSnackbar("Success", "Welcome ${user['usernm']}", kPrimaryGreen);
      _clearInputFields();
      return true;
    } else {
      _showSnackbar("Error", "Invalid user type", kPrimaryRed);
      return false;
    }
  }

  Future<void> _saveUserInfo(dynamic user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("TYPE", user['TYPE'].toString());
    sharedPreferences.setString("name", user['name'].toString());
    sharedPreferences.setString("img", user['img'].toString());
    sharedPreferences.setString("usernm", user['usernm'] ?? "");
  }

  void _showSnackbar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      colorText: kWhiteColor,
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 1),
    );
  }

  void _showInvalidCredentialsError() {
    _showSnackbar("Error", "Invalid username or password", kPrimaryRed);
  }

  void _clearInputFields() {
    emailController.clear();
    passwordController.clear();
  }

  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void saveLoginInfo(String username, String password) {
    loginRepository.saveLoginInfo(username, password);
  }

  void isLogin(bool isLogin) {
    loginRepository.isLogin(isLogin);
  }

  void clearUserInfo() {
    loginRepository.clearUserInfo();
  }
}
