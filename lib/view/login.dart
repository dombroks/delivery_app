import 'package:delivery/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  SizedBox(
                    width: screenSize.width * 0.8,
                    height: 48,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(8.0),
                            ),
                          ),
                          hintText: "Email",
                          filled: true,
                          hintStyle: new TextStyle(
                              color: kGrey.withOpacity(0.7),
                              fontWeight: FontWeight.bold),
                          fillColor: kGrey.withOpacity(0.12)),
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
