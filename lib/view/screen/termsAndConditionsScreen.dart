import 'package:delivery/utils/constants.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Terms and conditions",
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: screenSize.width,
          height: screenSize.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ipsum felis, vitae aliquet arcu condimentum at blandit nunc blandit. Mauris bibendum morbi vel imperdiet vestibulum at. Nunc dictum enim aenean cursus lacus adipiscing malesuada eu. Ullamcorper ultrices sagittis ut luctus tristique."),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Terms and conditions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ipsum felis, vitae aliquet arcu condimentum at blandit nunc blandit. Mauris bibendum morbi vel imperdiet vestibulum at. Nunc dictum enim aenean cursus lacus adipiscing malesuada eu. Ullamcorper ultrices sagittis ut luctus tristique."),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Terms and conditions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ipsum felis, vitae aliquet arcu condimentum at blandit nunc blandit. Mauris bibendum morbi vel imperdiet vestibulum at. Nunc dictum enim aenean cursus lacus adipiscing malesuada eu. Ullamcorper ultrices sagittis ut luctus tristique."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
