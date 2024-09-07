import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/log_in_controller.dart';
import '../../res/components/app_colors.dart';
import '../../res/components/button.dart';
import '../../res/constants/fonts.dart';
import '../common/login.dart';

class ProfileView extends StatelessWidget {
  final LoginController loginController =
      Get.put(LoginController(loginRepository: Get.find()));
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        buildTextField("Name", "John Doe"),
        buildTextField("Father Name", "John Doe"),
        buildTextField("Date joined", "01/01/2000"),
        buildTextField("Role", "Employee"),
        SizedBox(height: Get.height * 0.02),
        CustomButton(
          widthValue: Get.width * 0.4,
          text: "Log Out",
          color: kDarkColor,
          press: () {
            Get.to(() => LogInView());
            loginController.isLogin(false);
          },
        ),
      ],
    );
  }

  Widget buildTextField(String text, String value, {Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: CustomFontSize.medium(Get.context!),
                    fontWeight: FontWeight.bold,
                    color: textColor ?? kDarkColor,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: CustomFontSize.medium(Get.context!),
                    color: textColor ?? kDarkColor,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: kPrimaryColor,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
