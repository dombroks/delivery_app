import 'package:delivery/viewmodel/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'component/CustomButton.dart';
import 'component/CustomDotStepper.dart';
import 'component/CustomOutlinedButton.dart';

class ThirdRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var registerViewModel = Provider.of<RegisterViewModel>(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Upload ID Card"),
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
                  activeDot: 2,
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  child: SizedBox(
                    child: SvgPicture.asset("assets/images/ID vectorID.svg"),
                    width: screenSize.width * 0.6,
                    height: screenSize.height * 0.3,
                  ),
                  onTap: () async {},
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
                        child: CustomOutlinedButton(
                          role: () {
                            Navigator.of(context).pushNamed('/secondRegisterScreen');
                          },
                          text: "Back",
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: CustomButton(
                          text: "Finish",
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