import 'package:delivery/view/component/app_icons.dart';
import 'package:flutter/material.dart';

import 'component/CustomSettingsScreenRowItem.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed('/homeScreen');
          },
          color: Colors.black,
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                CustomSettingsScreenRowItem(
                  title: "In work",
                  subTitle: "Update your work state",
                  icon: Icons.directions_car,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomSettingsScreenRowItem(
                  title: "Language",
                  subTitle: "Select language",
                  icon: Icons.language,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomSettingsScreenRowItem(
                  title: "Dark Mode",
                  subTitle: "Toggle app mode",
                  icon: AppIcons.moon,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
