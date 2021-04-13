import 'package:delivery/view/component/app_icons.dart';
import 'package:delivery/view/darkTheme/themProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/CustomSettingsScreenRowItem.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isInWork = true;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
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
                  widget: Switch(
                      value: isInWork,
                      onChanged: (value) {
                        setState(() {
                          isInWork = value;
                        });
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomSettingsScreenRowItem(
                  title: "Dark Mode",
                  subTitle: "Toggle app mode",
                  icon: AppIcons.moon,
                  widget: Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = value;
                          themeProvider.swapTheme();
                        });
                      }),
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
