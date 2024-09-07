import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/res/constants/fonts.dart';
import 'package:tic_tac_toe/view/pages/about_view.dart';

import '../../res/components/app_colors.dart';
import '../../res/components/size.dart';

class ModeView extends StatelessWidget {
  const ModeView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("T",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryYellow)),
                  Text("I",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryRed)),
                  Text("C",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryYellow)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("T",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryRed)),
                  Text("A",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryYellow)),
                  Text("C",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryRed)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("T",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryYellow)),
                  Text("O",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryRed)),
                  Text("E",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryYellow)),
                ],
              ),
              getVerticalSpace(10),
              Container(
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kButtonFirstStart, kButtonFirstEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Single Player",
                      style: TextStyle(
                          fontSize: CustomFontSize.extraExtraLarge(context),
                          color: kWhiteColor),
                    ),
                  ),
                ),
              ),
              getVerticalSpace(15),
              Container(
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kButtonSecondStart, kButtonSecondEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Multi Player",
                      style: TextStyle(
                          fontSize: CustomFontSize.extraExtraLarge(context),
                          color: kWhiteColor),
                    ),
                  ),
                ),
              ),
              getVerticalSpace(15),
              Container(
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kButtonThirdStart, kButtonThirdEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Online",
                      style: TextStyle(
                          fontSize: CustomFontSize.extraExtraLarge(context),
                          color: kWhiteColor),
                    ),
                  ),
                ),
              ),
              getVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Need Help? ", style: TextStyle(color: kWhiteColor)),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => AboutUsView());
                    },
                    child: Text(
                      "About Us",
                      style: TextStyle(color: kPrimaryYellow),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
