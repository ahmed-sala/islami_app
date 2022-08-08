import 'package:flutter/material.dart';
import 'package:islami_app/hadeeth_tab/hadeet.dart';
import 'package:islami_app/myColors.dart';
import 'package:islami_app/radio_tab/radio.dart';
import 'package:islami_app/sebha_tab/sebha.dart';

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'islami',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: MyColor.primaryColor,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            selectedIconTheme: IconThemeData(
              color: Colors.black,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
            selectedLabelStyle: TextStyle(
              color: Colors.black,
            ),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
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

  List<Widget> tabs = [quran_tab(), hadeeth_tab(), sebha_tab(), radio_tab()];
}
