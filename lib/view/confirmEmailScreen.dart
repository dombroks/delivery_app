import 'package:delivery/constants.dart';
import 'package:delivery/view/component/CustomButton.dart';
import 'package:delivery/view/component/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Container(
              padding: EdgeInsets.all(50),
              width: screenSize.width * 0.70,
              height: screenSize.width * 0.70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGrey.withOpacity(0.18),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/confirmEmail.svg",
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            CustomTextFiled(screenSize: screenSize, hintText: "Enter code"),
            SizedBox(
              height: 10,
            ),
            Text(
              "02:33",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kGrey.withOpacity(0.8)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Resend code",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: kGrey.withOpacity(0.8)),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            CustomButton(
              text: "Confirm code",
            )
          ],
        ),
      )),
    );
  }
}
