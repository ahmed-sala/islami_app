import 'package:flutter/material.dart';
import 'package:islami_app/homeScreen.dart';
import 'package:islami_app/quran_tab/sura_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IslamiApp',
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
