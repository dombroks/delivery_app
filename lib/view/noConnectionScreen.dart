import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoConnectionScreen extends StatefulWidget {
  @override
  _NoConnectionScreenState createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset("assets/images/satelite.svg")],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
