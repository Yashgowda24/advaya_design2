import 'package:flutter/material.dart';
import 'package:new_design_advaya/components/learning_goals/text_subText_widget.dart';
import 'package:new_design_advaya/components/login/green_button.dart';
import 'package:new_design_advaya/views/home/home.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                GoalTextBodyWidget(
                  heading: 'Fill your profile',
                  subText: 'Enter your Personal details in below fields',
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextWidget(
                  hintText: 'Enter Full Name',
                  keyboardType: TextInputType.name,
                ),
                TextWidget(
                  hintText: 'Phone',
                  keyboardType: TextInputType.phone,
                ),
                TextWidget(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                GreenButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class TextWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;

  const TextWidget({
    required this.hintText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Container(
          padding: const EdgeInsets.only(
            left: 15,
            right: 10,
            top: 5,
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(211, 209, 216, 0.25),
            border: Border.all(
              width: 1,
              color: Colors.blueGrey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hintText,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 12.0,
                  color: Color.fromRGBO(100, 100, 100, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                keyboardType: keyboardType,
                // controller: controller,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16.0,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
