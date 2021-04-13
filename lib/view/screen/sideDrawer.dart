import 'package:delivery/service/multiLanguageService/app_localization.dart';
import 'package:delivery/utils/constants.dart';
import 'package:flutter/material.dart';

import '../component/CustomSideDrawerRowItem.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/someone.png")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Paul Walker",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Second Level Driver",
                            style: TextStyle(fontSize: 13, color: kGrey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.035,
                ),
                Container(
                  color: Colors.grey[400],
                  width: screenSize.width * 0.9,
                  height: 0.4,
                ),
                SizedBox(
                  height: screenSize.height * 0.035,
                ),
                CustomSideDrawerRowItem(
                  screenSize: screenSize,
                  icon: Icons.account_circle,
                  title:
                      AppLocalizations.of(context).translate("Personal_data"),
                  destinationScreen: "/personalDataScreen",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomSideDrawerRowItem(
                  screenSize: screenSize,
                  icon: Icons.history,
                  title: AppLocalizations.of(context).translate("History"),
                  destinationScreen: "/personalDataScreen",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomSideDrawerRowItem(
                  screenSize: screenSize,
                  icon: Icons.attach_money,
                  title: AppLocalizations.of(context).translate("Account"),
                  destinationScreen: "/personalDataScreen",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomSideDrawerRowItem(
                  screenSize: screenSize,
                  icon: Icons.star,
                  title: AppLocalizations.of(context).translate("Reviews"),
                  destinationScreen: "/personalDataScreen",
                ),
                SizedBox(
                  height: screenSize.height * 0.035,
                ),
                Container(
                  color: Colors.grey[400],
                  width: screenSize.width * 0.9,
                  height: 0.4,
                ),
                SizedBox(
                  height: screenSize.height * 0.035,
                ),
                CustomSideDrawerRowItem(
                  screenSize: screenSize,
                  icon: Icons.insert_drive_file,
                  title: AppLocalizations.of(context)
                      .translate("Terms_and_conditions"),
                  destinationScreen: "/termsAndConditionsScreen",
                ),
                SizedBox(
                  height: screenSize.height * 0.035,
                ),
                CustomSideDrawerRowItem(
                  screenSize: screenSize,
                  icon: Icons.help,
                  title: "FAQs",
                  destinationScreen: "/personalDataScreen",
                ),
                SizedBox(
                  height: screenSize.height * 0.035,
                ),
                CustomSideDrawerRowItem(
                  screenSize: screenSize,
                  icon: Icons.supervisor_account,
                  title: AppLocalizations.of(context).translate("Help_center"),
                  destinationScreen: "/personalDataScreen",
                ),
                SizedBox(
                  height: screenSize.height * 0.035,
                ),
                CustomSideDrawerRowItem(
                  screenSize: screenSize,
                  icon: Icons.settings,
                  title: AppLocalizations.of(context).translate("Settings"),
                  destinationScreen: "/settingsScreen",
                ),
                SizedBox(
                  height: screenSize.height * 0.15,
                ),
                GestureDetector(
                  child: CustomSideDrawerRowItem(
                    isForLogout: true,
                    screenSize: screenSize,
                    icon: Icons.exit_to_app,
                    title: AppLocalizations.of(context).translate("Logout"),
                    destinationScreen: "/personalDataScreen",
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
