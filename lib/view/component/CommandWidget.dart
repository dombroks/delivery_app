import 'package:delivery/utils/constants.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'CustomButton.dart';

class CommandWidget extends StatelessWidget {
  const CommandWidget({
    Key key,
    this.imageUrl,
    this.clientName,
    this.price,
    this.distance,
    this.pickUpAddress,
    this.dropOffAddress,
  }) : super(key: key);
  final String imageUrl;
  final String clientName;
  final String price;
  final String distance;
  final String pickUpAddress;
  final String dropOffAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: kPrimaryColor,
        ),
      ),
      child: ExpandablePanel(
        hasIcon: false,
        header: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    "assets/images/someone.png",
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            clientName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$$price",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$distance km",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        collapsed: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PICK UP",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(pickUpAddress,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "DROP OFF",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(dropOffAddress,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  text: "Accept",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
