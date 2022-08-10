import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/hadeeth_tab/hadeethScreen.dart';
import 'package:islami_app/home/homeScreen.dart';
import 'package:islami_app/home/quran_tab/sura_details.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider<SettingProvider>(
      create: (buildContext) {
        return SettingProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingProvider>(context);
    getValueFromShared();
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.currentLanguage),
      theme: MyTheme.lighttheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.curentTheme,
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

  void getValueFromShared() async {
    final pref = await SharedPreferences.getInstance();
    settingsProvider.changeLanguage(pref.getString('lang') ?? 'ar');
    if (pref.getString('theme') == 'light') {
      settingsProvider.changeTheme(ThemeMode.light);
    } else if (pref.getString('theme') == 'dark') {
      settingsProvider.changeTheme(ThemeMode.dark);
    }
  }
}
