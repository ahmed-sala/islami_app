import 'package:flutter/material.dart';
import 'package:islami_app/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IslamiApp',
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
