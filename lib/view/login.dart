import 'package:delivery/constants.dart';
import 'package:delivery/view/component/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'component/CustomTextField.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/biker.svg"),
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFiled(
                      screenSize: screenSize,
                      hintText: "Email",
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    CustomTextFiled(
                      screenSize: screenSize,
                      hintText: "Password",
                      isForPasword: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.84,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: kGrey.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              print("Forgot password");
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      text: "Login",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: kGrey.withOpacity(0.9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            " Register now",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            print("Register now");
                          },
                        )
                      ],
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
