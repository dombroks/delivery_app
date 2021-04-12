import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../component/CustomButton.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ConnectivityStatus networkStatus = Provider.of<ConnectivityStatus>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (networkStatus == ConnectivityStatus.Offline) {
        Navigator.pushNamed(context, '/noConnectionScreen');
      }
    });

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
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
              role: () {},
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
