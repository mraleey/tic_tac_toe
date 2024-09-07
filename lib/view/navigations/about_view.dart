import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/components/app_colors.dart';
import '../../res/components/button.dart';
import '../../res/components/size.dart';
import '../home.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/about.png",
                      height: getScreenHeight(215),
                      width: getScreenWidth(335),
                      fit: BoxFit.cover,
                    ),
                  ),
                  getVerticalSpace(20),
                  Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      fontSize: getTextSize(17),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  getVerticalSpace(15),
                  Text(
                    """Welcome to our revolutionary biometric attendance app! We are committed to simplifying attendance tracking for businesses and institutions worldwide. Our cutting-edge app employs state-of-the-art biometric technology, ensuring accurate and secure attendance records.

With a user-friendly interface, employees and students can effortlessly clock in and out using their unique biometric identifiers, such as fingerprints or facial recognition. Say goodbye to outdated and unreliable attendance systems! Our app guarantees real-time data, streamlining HR processes and increasing productivity.

Rest assured, data privacy and security are our top priorities. Your information is encrypted and protected, offering peace of mind for both administrators and users.

Join us in embracing the future of attendance management with our advanced biometric app today!""",
                    style: TextStyle(
                      fontSize: getTextSize(15),
                      fontWeight: FontWeight.w400,
                      color: kDarkColor,
                      letterSpacing: 0.17,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              widthValue: getScreenWidth(335),
              color: kPrimaryColor,
              text: "Back To Previous",
              press: () => Get.to(
                () => const HomeView(),
                transition: Transition.cupertino,
                duration: const Duration(milliseconds: 700),
              ),
            ),
            getVerticalSpace(20),
          ],
        ),
      ),
    );
  }
}
