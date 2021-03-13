import 'package:delivery/constants.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/images/biker.svg"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFiled(
                    screenSize: screenSize,
                    hintText: "Email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                    screenSize: screenSize,
                    hintText: "Password",
                    isForPasword: true,
                  ),
                  SizedBox(
                    height: 5,
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
                            print("I have been clicked");
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
