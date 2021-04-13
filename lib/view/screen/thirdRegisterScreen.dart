import 'package:delivery/viewmodel/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../component/CustomButton.dart';
import '../component/CustomDotStepper.dart';
import '../component/CustomOutlinedButton.dart';

class ThirdRegisterScreen extends StatefulWidget {
  @override
  _ThirdRegisterScreenState createState() => _ThirdRegisterScreenState();
}

class _ThirdRegisterScreenState extends State<ThirdRegisterScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var registerViewModel = Provider.of<RegisterViewModel>(context);
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "Upload ID Card",
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
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Tap to upload your ID card",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17, color: kGrey),
                ),
                SizedBox(
                  height: screenSize.height * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Checkbox(
                          activeColor: kPrimaryColor,
                          checkColor: kPrimaryColor,
                          value: isChecked,
                          onChanged: (val) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          }),
                      Text(
                        "I agree to the ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        child: Text("Terms and Conditions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                                fontSize: 15)),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/termsAndConditionsScreen');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
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
                            Navigator.of(context)
                                .pushNamed('/secondRegisterScreen');
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
