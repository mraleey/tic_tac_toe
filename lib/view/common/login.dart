import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/components/app_colors.dart';
import '../../res/components/textfield.dart';
import '../../res/constants/fonts.dart';
import '../../controller/log_in_controller.dart';
import 'animations.dart';

class LogInView extends StatelessWidget {
  LogInView({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: CustomFontSize.extraExtraLarge(context) + 10,
                  color: kDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Get.height * 0.06),
              CustomTextField(
                controller: loginController.emailController,
                focusNode: loginController.emailFocus,
                labelText: 'Employee ID',
                obscureText: false,
                prefixIcon: Icons.email,
                prefixIconColor: kPrimaryGreen,
                borderColor: kDarkColor,
                labelColor: kDarkColor,
              ),
              SizedBox(height: Get.height * 0.02),
              Obx(
                () => CustomTextField(
                  controller: loginController.passwordController,
                  focusNode: loginController.passwordFocus,
                  labelText: "Password",
                  prefixIcon: Icons.lock,
                  obscureText: loginController.isPasswordVisible.value,
                  prefixIconColor: kPrimaryGreen,
                  borderColor: kDarkColor,
                  labelColor: kDarkColor,
                  suffixIcon: InkWell(
                    onTap: () {
                      loginController.togglePasswordVisibility();
                    },
                    child: loginController.isPasswordVisible.value
                        ? const Icon(
                            Icons.visibility,
                            color: kPrimaryGreen,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: kPrimaryGreen,
                          ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: loginController.rememberMe.value,
                            onChanged: (value) {
                              loginController.rememberMe.value = value!;
                            },
                            activeColor: kPrimaryGreen,
                          ),
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: CustomFontSize.large(context),
                            color: kDarkColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('/forgot-password');
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: CustomFontSize.large(context),
                          color: kPrimaryGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => loginController.isLoading.value
                    ? const AnimatedBar()
                    : MaterialButton(
                        minWidth: double.infinity,
                        color: kPrimaryGrey,
                        height: 50,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        onPressed: () {
                          loginController.postLoginData({
                            "username":
                                loginController.emailController.text.trim(),
                            "password":
                                loginController.passwordController.text.trim()
                          }).then(
                            (value) {
                              if (value == true) {
                                loginController.isLogin(value);
                              } else {
                                loginController.isLogin(value);
                              }
                            },
                          );
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 3,
                    width: Get.width * 0.35,
                    color: kDarkColor,
                  ),
                  Text(
                    "   OR    ",
                    style: TextStyle(
                      fontSize: CustomFontSize.large(context),
                      color: kDarkColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: Get.width * 0.35,
                    color: kDarkColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: CustomFontSize.large(context),
                      color: kDarkColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
