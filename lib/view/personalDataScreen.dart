import 'package:delivery/constants.dart';
import 'package:flutter/material.dart';

class PersonalDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Personal Data",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        actions: [
          SizedBox(
            width: screenSize.width * 0.1,
          )
        ],
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/person.png"),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
