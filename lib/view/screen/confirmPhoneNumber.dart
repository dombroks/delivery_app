import 'dart:async';

import 'package:delivery/utils/constants.dart';
import 'package:delivery/view/component/CustomButton.dart';
import 'package:delivery/view/component/CustomTextField.dart';
import 'package:delivery/viewmodel/AuthViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ConfirmPhoneNumberScreen extends StatefulWidget {
  @override
  _ConfirmPhoneNumberScreenState createState() =>
      _ConfirmPhoneNumberScreenState();
}

class _ConfirmPhoneNumberScreenState extends State<ConfirmPhoneNumberScreen> {
  Duration timeout = Duration(minutes: 2);
  bool isVisible = false;
  final codeController = TextEditingController();

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeout = timeout - Duration(seconds: 1);
      });
      if (timeout == Duration(seconds: -1)) {
        timeout = Duration(minutes: 2);
        isVisible = true;
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/phone.svg",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.1,
              ),
              CustomTextFiled(
                screenSize: screenSize,
                hintText: "Enter code",
                controller: codeController,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                timeout.toString().substring(2, 7),
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: kGrey.withOpacity(0.8)),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  child: Text(
                    "Resend code",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: kGrey.withOpacity(0.8)),
                  ),
                  onTap: () {
                    authViewModel.resendActivationCode();
                    startTimer();
                    setState(() {
                      isVisible = false;
                    });
                  },
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.18,
              ),
              CustomButton(
                text: "Confirm code",
                role: () {
                  authViewModel.confirmSentCode(codeController.text.trim());
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
