import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/quran_tab/verses_screen.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<SettingProvider>(context);

    if (verses.isEmpty) readFile(args.index);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getMainBackground()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: verses.length == 0
            ? Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ))
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 64),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    return VerseWidget(
                      title: verses[index],
                      index: index,
                    );
                  },
                  itemCount: verses.length,
                  separatorBuilder: (_, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 64),
                    color: Theme.of(context).primaryColor,
                    width: double.infinity,
                    height: 2,
                  ),
                ),
              ),
      ),
    );
  }

  void readFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    print(verses);
    setState(() {});
  }
}

class SuraDetailsArgs {
  int index;
  String title;

  SuraDetailsArgs({required this.title, required this.index});
}
