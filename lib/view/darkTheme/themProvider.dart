import 'package:delivery/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme;
  ThemeData light = ThemeData.light().copyWith(
    primaryColorLight: kPrimaryColor,
    accentColor: kPrimaryColor,
    buttonTheme: ButtonThemeData(buttonColor: kPrimaryColor),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 36.0, color: Colors.black),
        headline6: TextStyle(fontSize: 36.0, color: Colors.black),
        bodyText2: TextStyle(fontSize: 36.0, color: Colors.black),
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    buttonColor: kPrimaryColor,
  );

  ThemeData dark = ThemeData.dark().copyWith(
    iconTheme: IconThemeData(color: Colors.black),
    buttonTheme: ButtonThemeData(buttonColor: Colors.white),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 36.0, color: Colors.white),
        headline6: TextStyle(fontSize: 36.0, color: Colors.white),
        bodyText2: TextStyle(fontSize: 36.0, color: Colors.white),
      ),
    ),
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
  );

  ThemeProvider(bool isDarkMode) {
    this._selectedTheme = isDarkMode ? dark : light;
  }

  ThemeData get getTheme => _selectedTheme;

  void swapTheme() {
    _selectedTheme = _selectedTheme == dark ? light : dark;
    notifyListeners();
  }
}
