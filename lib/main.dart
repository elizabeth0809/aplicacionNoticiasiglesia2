import 'package:flutter/material.dart';

import 'package:wordpress_iglesia/homePage/homePage.dart';
import 'global/globals.dart' as globals;

void main() {
  globals.appNavigator = GlobalKey<NavigatorState>();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Manatial de Vida II',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        navigatorKey: globals.appNavigator,
        home: HomePage());
  }
}
