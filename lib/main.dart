import 'package:delivery/service/ConnectivityService.dart';
import 'package:delivery/view/getStarted.dart';
import 'package:delivery/view/login.dart';
import 'package:delivery/view/noConnectionScreen.dart';
import 'package:delivery/viewmodel/AuthViewModel.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        StreamProvider(
            create: (context) =>
                ConnectivityService().connectionStatusController.stream),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/getStartedScreen': (context) => GetStartedScreen(),
          '/noConnectionScreen': (context) => NoConnectionScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Delivery app',
      ),
    );
  }
}
