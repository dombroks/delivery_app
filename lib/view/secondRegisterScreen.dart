import 'package:delivery/constants.dart';
import 'package:delivery/view/component/CustomButton.dart';
import 'package:delivery/view/component/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'component/CustomDotStepper.dart';

class SecondRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Upload Profile Picture"),
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomDotStepper(
                  activeDot: 1,
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: SvgPicture.asset("assets/images/user.svg"),
                  width: screenSize.width * 0.6,
                  height: screenSize.height * 0.3,
                ),
                Text(
                  "Tap to select a picture",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17, color: kGrey),
                ),
                SizedBox(
                  height: screenSize.height * 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: CustomButton(
                          text: "Back",
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: CustomButton(
                          text: "Next",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
