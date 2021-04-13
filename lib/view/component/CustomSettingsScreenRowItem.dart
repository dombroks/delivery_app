import 'package:delivery/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomSettingsScreenRowItem extends StatelessWidget {
  const CustomSettingsScreenRowItem({
    Key key,
    this.screenSize,
    this.title,
    this.subTitle,
    this.icon,
    this.widget,
  }) : super(key: key);
  final Size screenSize;

  final String title;
  final String subTitle;
  final IconData icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: kPrimaryColor,
                  size: 26,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
        widget,
      ],
    );
  }
}
