import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/hadeeth_tab/hadeet.dart';
import 'package:islami_app/home/quran_tab/quran.dart';
import 'package:islami_app/home/radio_tab/radio.dart';
import 'package:islami_app/home/sebha_tab/sebha_tab.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/settings/setting_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.getMainBackground(),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.app_title,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
              label: AppLocalizations.of(context)!.quran_title,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: ImageIcon(AssetImage('assets/images/ic_hadeeth.png')),
              label: AppLocalizations.of(context)!.hadeth_title,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
              label: AppLocalizations.of(context)!.tasbeh_title,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
              label: AppLocalizations.of(context)!.radio_title,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.setting_title,
            ),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [
    Quran_tab(),
    hadeeth_tab(),
    sebhaTab(),
    radio_tab(),
    SettingTab()
  ];
}
