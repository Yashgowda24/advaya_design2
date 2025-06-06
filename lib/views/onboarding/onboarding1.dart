import 'package:flutter/material.dart';
import 'package:new_design_advaya/components/onboard/onboard_screen_widget.dart';
import 'package:new_design_advaya/views/onboarding/onboarding2.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: onBoardingWidget(
        image:
            Image.asset('assets/images/onboard/GyaanPlant_Latest_Logo_1.png'),
        buttonText: "Let's Get Started",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnBoarding2(),
            ),
          );
        },
      ),
    );
  }
}
