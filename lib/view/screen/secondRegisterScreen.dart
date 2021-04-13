import 'dart:convert';
import 'dart:typed_data';

import 'package:delivery/utils/constants.dart';
import 'package:delivery/view/component/CustomButton.dart';
import 'package:delivery/viewmodel/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../component/CustomDotStepper.dart';
import '../component/CustomOutlinedButton.dart';

class SecondRegisterScreen extends StatelessWidget {
  Uint8List _bytesImage;
  Widget _image;
  @override
  Widget build(BuildContext context) {
    var registerViewModel = Provider.of<RegisterViewModel>(context);
    var screenSize = MediaQuery.of(context).size;

    if (_bytesImage == null) {
      _image = SvgPicture.asset("assets/images/user.svg");
    } else {
      _image = Image.memory(_bytesImage);
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "Upload Profile Picture",
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
                  activeDot: 1,
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  child: SizedBox(
                    child: _image,
                    width: screenSize.width * 0.6,
                    height: screenSize.height * 0.3,
                  ),
                  onTap: () async {
                    _bytesImage = Base64Decoder()
                        .convert(registerViewModel.getImage().toString());
                  },
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
                            Navigator.of(context)
                                .pushNamed('/firstRegistrationScreen');
                          },
                          text: "Back",
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: CustomButton(
                          text: "Next",
                          role: () {
                            Navigator.of(context)
                                .pushNamed('/thirdRegisterScreen');
                          },
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
