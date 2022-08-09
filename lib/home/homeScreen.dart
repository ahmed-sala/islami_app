import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeeth_tab/hadeet.dart';
import 'package:islami_app/home/quran_tab/quran.dart';
import 'package:islami_app/home/radio_tab/radio.dart';
import 'package:islami_app/home/sebha_tab/sebha.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'islami',
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_hadeeth.png')),
                  label: 'Hadeeth'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                  label: 'Sebha'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                  label: 'Radio'),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [Quran_tab(), hadeeth_tab(), sebha_tab(), radio_tab()];
}
