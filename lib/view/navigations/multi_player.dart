import 'package:flutter/material.dart';

import '../../res/components/app_colors.dart';
import '../../res/components/size.dart';
import '../../res/constants/fonts.dart';

class MultiPlayerView extends StatelessWidget {
  const MultiPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  "Multi Player Mode",
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: CustomFontSize.iconsFont(context)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: kPrimaryColor,
                            child: Image(
                                image: AssetImage("assets/images/tick.png")),
                          ),
                          Text(
                            "Tick",
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: CustomFontSize.iconsFont(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    getHorizontalSpace(20),
                    const Text(
                      "VS",
                      style: TextStyle(color: kWhiteColor, fontSize: 20),
                    ),
                    getHorizontalSpace(20),
                    Container(
                      width: 100,
                      color: kPrimaryColor,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: kPrimaryColor,
                            child: Image(
                                image: AssetImage("assets/images/cross.png")),
                          ),
                          Text(
                            "Cross",
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: CustomFontSize.iconsFont(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
