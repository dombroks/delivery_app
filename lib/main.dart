import 'package:delivery/app_localization.dart';
import 'package:delivery/view/firstRegisterScreen.dart';
import 'package:delivery/view/secondRegisterScreen.dart';
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
          '/': (context) => ThirdRegisterScreen(),
          '/getStartedScreen': (context) => GetStartedScreen(),
          '/noConnectionScreen': (context) => NoConnectionScreen(),
          '/firstRegisterScreen': (context) => FirstRegisterScreen(),
          '/secondRegisterScreen': (context) => SecondRegisterScreen(),
          '/thirdRegisterScreen': (context) => ThirdRegisterScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Delivery app',
      ),
    );
  }
}
