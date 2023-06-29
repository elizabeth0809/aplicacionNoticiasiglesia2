import 'package:flutter/material.dart';

import 'package:wordpress_iglesia/homePage/homePage.dart';


void main() {
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
        home: HomePage());
  }
}
