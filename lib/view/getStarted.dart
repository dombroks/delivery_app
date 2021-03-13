import 'package:delivery/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'component/CustomButton.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/images/bike.svg"),
            Column(
              children: [
                Text("Express Delivery",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Join our delivery team",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.3,
            ),
            CustomButton(
              text: "Get Started",
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

