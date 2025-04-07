import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_design_advaya/components/login/green_button.dart';
import 'package:new_design_advaya/styles/styles.dart';

class LoginWidget extends StatelessWidget {
  final Image image;
  final String heading;
  final String subText;
  final String hintText;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isOtpField;

  LoginWidget(
      {required this.image,
      required this.heading,
      required this.subText,
      required this.buttonText,
      required this.hintText,
      required this.onPressed,
      this.isOtpField = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          image,
          SizedBox(
            height: 60,
          ),
          Text(
            heading,
            style: kGilroy28700,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            subText,
            style: kGilroy16500,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          isOtpField
              ? OtpTextField(
                  numberOfFields: 4,
                  borderColor: Color.fromRGBO(217, 217, 217, 1),
                  focusedBorderColor: Color.fromRGBO(61, 123, 66, 1),
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(12),
                  fieldWidth: 60,
                  autoFocus: true,
                  filled: true,
                  fillColor: Colors.white,
                  onSubmit: (String verificationCode) {
                    print("OTP Entered: $verificationCode");
                  },
                )
              : Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.86,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: hintText,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
          SizedBox(
            height: 30,
          ),
          GreenButton(
            text: buttonText,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
