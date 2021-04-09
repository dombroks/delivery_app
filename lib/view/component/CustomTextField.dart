import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({
    Key key,
    @required this.screenSize,
    @required this.hintText,
    this.isForPasword = false,
    this.controller,
    this.isForMobileNumber = false,
  }) : super(key: key);

  final String hintText;
  final bool isForPasword;
  final Size screenSize;
  final isForMobileNumber;
  final controller;

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    TextInputType type;
    if (widget.isForMobileNumber) {
      type = TextInputType.phone;
    } else {
      type = TextInputType.text;
    }

    return SizedBox(
      width: widget.screenSize.width * 0.85,
      height: 48,
      child: TextField(
        controller: widget.controller,
        keyboardType: type,
        decoration: InputDecoration(
            suffixIcon: Visibility(
              child: GestureDetector(
                child: Icon(
                  Icons.remove_red_eye,
                  size: 18,
                ),
                onTap: () {
                  _toggle();
                },
              ),
              visible: widget.isForPasword,
            ),
            border: new OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: const BorderRadius.all(
                const Radius.circular(8.0),
              ),
            ),
            hintText: "${widget.hintText}",
            filled: true,
            hintStyle: new TextStyle(
                fontSize: 14,
                color: kGrey.withOpacity(0.7),
                fontWeight: FontWeight.bold),
            fillColor: kGrey.withOpacity(0.12)),
        obscureText: _obscureText,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
