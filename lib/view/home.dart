import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/log_in_controller.dart';
import '../res/constants/fonts.dart';
import 'common/bottom_navigatiion.dart';
import 'common/login.dart';
import 'navigations/about_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController =
        Get.put(LoginController(loginRepository: Get.find()));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Hi, username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: CustomFontSize.extraLarge(context),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                  child: Image(
                      image: AssetImage("assets/images/splash_screen.png"))),
              ListTile(
                title: const Text('About Us'),
                onTap: () {
                  Get.to(() => const AboutUsView());
                },
              ),
              ListTile(
                  title: const Text('Log Out'),
                  onTap: () {
                    loginController.isLogin(false);
                    Get.to(() => LogInView());
                  }),
            ],
          ),
        ),
        body: const BottomNavigationBarView());
  }
}
