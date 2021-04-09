import 'package:delivery/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NoConnectionScreen extends StatefulWidget {
  @override
  _NoConnectionScreenState createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    ConnectivityStatus networkStatus = Provider.of<ConnectivityStatus>(context);
    return Scaffold(
      body: Container(
        child: GestureDetector(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/satelite.svg",
                  width: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "No internet connection",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Tap to refresh",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16, color: kGrey),
                )
              ],
            ),
          ),
          onTap: () {
            print("Taped");
            if (networkStatus == ConnectivityStatus.Online) {
              Navigator.pop(context);
            }
          },
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
