import 'package:delivery/utils/app_localization.dart';
import 'package:delivery/view/confirmEmailScreen.dart';
import 'package:delivery/view/confirmPhoneNumber.dart';
import 'package:delivery/view/darkTheme/darkThemeProvider.dart';
import 'package:delivery/view/darkTheme/styles.dart';
import 'package:delivery/view/firstRegisterScreen.dart';
import 'package:delivery/view/homeScreen.dart';
import 'package:delivery/view/personalDataScreen.dart';
import 'package:delivery/view/secondRegisterScreen.dart';
import 'package:delivery/view/settingsScreen.dart';
import 'package:delivery/view/sideDrawer.dart';
import 'package:delivery/view/termsAndConditionsScreen.dart';
import 'package:delivery/view/thirdRegisterScreen.dart';
import 'package:delivery/viewmodel/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:delivery/service/ConnectivityService.dart';
import 'package:delivery/view/getStartedScreen.dart';
import 'package:delivery/view/noConnectionScreen.dart';
import 'package:delivery/viewmodel/AuthViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        StreamProvider(
            create: (context) =>
                ConnectivityService().connectionStatusController.stream),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate
        ],
        supportedLocales: [const Locale('en', 'US'), const Locale('fr', 'FR')],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        initialRoute: '/',
        routes: {
          '/': (context) => SettingsScreen(),
          '/getStartedScreen': (context) => GetStartedScreen(),
          '/noConnectionScreen': (context) => NoConnectionScreen(),
          '/firstRegisterScreen': (context) => FirstRegisterScreen(),
          '/secondRegisterScreen': (context) => SecondRegisterScreen(),
          '/thirdRegisterScreen': (context) => ThirdRegisterScreen(),
          '/termsAndConditionsScreen': (context) => TermsAndConditionsScreen(),
          '/confirmEmailScreen': (context) => ConfirmEmail(),
          '/personalDataScreen': (context) => PersonalDataScreen(),
          '/confirmPhoneNumberScreen': (context) => ConfirmPhoneNumberScreen(),
          '/homeScreen' : (context) => HomeScreen()
        },
        debugShowCheckedModeBanner: false,
        title: 'Delivery app',
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
      ),
    );
  }
}
