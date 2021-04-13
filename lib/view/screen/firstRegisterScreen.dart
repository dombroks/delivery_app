import 'package:delivery/utils/constants.dart';
import 'package:delivery/view/component/CustomButton.dart';
import 'package:delivery/view/component/CustomTextField.dart';
import 'package:flutter/material.dart';

import '../component/CustomDotStepper.dart';

class FirstRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "Upload Personal Info",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDotStepper(
                  activeDot: 0,
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextFiled(screenSize: screenSize, hintText: "Full name"),
                SizedBox(
                  height: 15,
                ),
                CustomTextFiled(screenSize: screenSize, hintText: "Email"),
                SizedBox(
                  height: 15,
                ),
                CustomTextFiled(
                  screenSize: screenSize,
                  hintText: "Password",
                  isForPasword: true,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFiled(
                  screenSize: screenSize,
                  hintText: "Mobile Number",
                  isForMobileNumber: true,
                ),
                SizedBox(
                  height: screenSize.height * 0.30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 40,
                      child: CustomButton(
                        role: () {
                          Navigator.pushNamed(context, '/secondRegisterScreen');
                        },
                        text: "Next",
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
