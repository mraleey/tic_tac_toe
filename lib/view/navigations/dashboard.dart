import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../res/components/app_colors.dart';
import '../../res/components/size.dart';
import '../common/digitalclock.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Column(
      children: [
        const CustomDigitalClock(),
        Text(
          DateFormat('EEEE, MMM d, yyyy').format(DateTime.now()),
          style: TextStyle(
            fontSize: getTextSize(16),
            color: kDarkColor,
            fontWeight: FontWeight.w100,
          ),
        ),
        getVerticalSpace(10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: getScreenHeight(100),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                "assets/images/fingerprint.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          height: getScreenHeight(100),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check in",
                      style: TextStyle(
                        fontSize: getTextSize(14),
                        color: kPrimaryBlue,
                      ),
                    ),
                    Text(
                      "  |  ",
                      style: TextStyle(
                        fontSize: getTextSize(20),
                        color: kDarkColor,
                      ),
                    ),
                    Text(
                      "Check out",
                      style: TextStyle(
                        fontSize: getTextSize(14),
                        color: kPrimaryBlue,
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            height: getScreenHeight(40),
            decoration: BoxDecoration(
              color: kLightColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "0 hr 0 min",
                style: TextStyle(
                  fontSize: getTextSize(16),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
