import 'package:delivery/utils/app_localization.dart';
import 'package:delivery/utils/constants.dart';
import 'package:delivery/view/darkTheme/themProvider.dart';
import 'package:delivery/view/screen/confirmEmailScreen.dart';
import 'package:delivery/view/screen/confirmPhoneNumber.dart';
import 'package:delivery/view/screen/firstRegisterScreen.dart';
import 'package:delivery/view/screen/homeScreen.dart';
import 'package:delivery/view/screen/personalDataScreen.dart';
import 'package:delivery/view/screen/secondRegisterScreen.dart';
import 'package:delivery/view/screen/settingsScreen.dart';
import 'package:delivery/view/screen/termsAndConditionsScreen.dart';
import 'package:delivery/view/screen/thirdRegisterScreen.dart';
import 'package:delivery/viewmodel/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:delivery/service/ConnectivityService.dart';
import 'package:delivery/view/screen/getStartedScreen.dart';
import 'package:delivery/view/screen/noConnectionScreen.dart';
import 'package:delivery/viewmodel/AuthViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(false)),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        StreamProvider(
            create: (context) =>
                ConnectivityService().connectionStatusController.stream),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en', 'US'),
              const Locale('fr', 'FR')
            ],
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
              '/': (context) => HomeScreen(),
              '/getStartedScreen': (context) => GetStartedScreen(),
              '/noConnectionScreen': (context) => NoConnectionScreen(),
              '/firstRegisterScreen': (context) => FirstRegisterScreen(),
              '/secondRegisterScreen': (context) => SecondRegisterScreen(),
              '/thirdRegisterScreen': (context) => ThirdRegisterScreen(),
              '/termsAndConditionsScreen': (context) =>
                  TermsAndConditionsScreen(),
              '/confirmEmailScreen': (context) => ConfirmEmail(),
              '/personalDataScreen': (context) => PersonalDataScreen(),
              '/confirmPhoneNumberScreen': (context) =>
                  ConfirmPhoneNumberScreen(),
              '/homeScreen': (context) => HomeScreen(),
              '/settingsScreen': (context) => SettingsScreen(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Delivery app',
            theme: themeProvider.getTheme,
          );
        },
      ),
    );
  }
}
