import 'package:flutter/material.dart';
import 'package:new_design_advaya/components/onboard/onboard_screen_widget.dart';
import 'package:new_design_advaya/views/onboarding/onboarding3.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: onBoardingWidget(
        image: Image.asset('assets/images/onboard/Video-Stream.png'),
        text1: 'Welcome to Gyaan Plant',
        text2:
            "Start your learning journey with\nour comprehensive video courses\nand interactive exams",
        buttonText: 'Next',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnBoarding3(),
            ),
          );
        },
      ),
    );
  }
}