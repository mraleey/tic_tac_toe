import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/constants/fonts.dart';
import '../../repository/splash_services.dart';
import 'animations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.isLogIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/splash_screen.webp",
                  height: Get.height * 0.6,
                  width: Get.width * 0.6,
                ),
              ),
              const AnimatedBar(),
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: CustomFontSize.extraLarge(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
