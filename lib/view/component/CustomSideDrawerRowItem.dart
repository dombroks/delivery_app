import 'package:flutter/material.dart';

class CustomSideDrawerRowItem extends StatelessWidget {
  const CustomSideDrawerRowItem({
    Key key,
    @required this.screenSize,
    this.title,
    this.destinationScreen,
    this.icon,
    this.isForLogout = false,
  }) : super(key: key);

  final Size screenSize;
  final String title;
  final String destinationScreen;
  final IconData icon;
  final isForLogout;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: Colors.grey[200],
              ),
              child: Icon(
                icon,
                size: 17,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        GestureDetector(
          child: Visibility(
            visible: !isForLogout,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(destinationScreen);
          },
        )
      ],
    );
  }
}
