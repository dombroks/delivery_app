import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function role;
  const CustomButton({
    Key key,
    this.text,
    this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.85,
      height: 45,
      child: RaisedButton(
        onPressed: () {
          role();
        },
        color: kPrimaryColor,
        child: Text(
          "$text",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
    );
  }
}
