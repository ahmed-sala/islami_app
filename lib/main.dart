import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeeth_tab/hadeethScreen.dart';
import 'package:islami_app/home/homeScreen.dart';
import 'package:islami_app/home/quran_tab/sura_details.dart';
import 'package:islami_app/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lighttheme,
      debugShowCheckedModeBanner: false,
      title: 'IslamiApp',
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadeethScreen.routeName: (_) => HadeethScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
