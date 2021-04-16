import 'package:delivery/view/component/CommandWidget.dart';
import 'package:delivery/view/screen/sideDrawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Container(
              width: 30.0,
              height: 30.0,
              child: Image.asset("assets/images/someone.png"),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/personalDataScreen");
            },
          ),
          SizedBox(width: 20)
        ],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Commands",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                CommandWidget(
                  clientName: "Joe Hogg",
                  pickUpAddress:
                      "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                  dropOffAddress: "6391 Elgin St. Celina, Delaware 10299",
                  distance: "3.17",
                  price: "57.00",
                ),
                CommandWidget(
                  clientName: "Will Smith",
                  pickUpAddress:
                      "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                  dropOffAddress: "6391 Elgin St. Celina, Delaware 10299",
                  distance: "10.3",
                  price: "107.23",
                ),
                CommandWidget(
                  clientName: "Opera",
                  pickUpAddress:
                      "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                  dropOffAddress: "6391 Elgin St. Celina, Delaware 10299",
                  distance: "3.17",
                  price: "57.00",
                ),
                CommandWidget(
                  clientName: "Joe Hogg",
                  pickUpAddress:
                      "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                  dropOffAddress: "6391 Elgin St. Celina, Delaware 10299",
                  distance: "3.17",
                  price: "57.00",
                ),
                CommandWidget(
                  clientName: "Joe Hogg",
                  pickUpAddress:
                      "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                  dropOffAddress: "6391 Elgin St. Celina, Delaware 10299",
                  distance: "3.17",
                  price: "57.00",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
