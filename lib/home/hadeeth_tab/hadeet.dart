import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/hadeeth_tab/hadethWidget.dart';

class hadeeth_tab extends StatefulWidget {
  @override
  State<hadeeth_tab> createState() => _hadeeth_tabState();
}

class _hadeeth_tabState extends State<hadeeth_tab> {
  List<hadeeth> hadeethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadeethList.isEmpty) readHadeethFile();
    return Column(
      children: [
        Image.asset('assets/images/hadeethLogo.png'),
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2))),
            child: Text(
              'الأحاديث',
              style: Theme.of(context).textTheme.headline4,
            )),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              return HadeethWidget(
                  title: hadeethList[index].title,
                  content: hadeethList[index].content);
            },
            itemCount: hadeethList.length,
          ),
        )
      ],
    );
  }

  void readHadeethFile() async {
    String filecontent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<hadeeth> hadeethFile = [];
    List<String> allHadeeth = filecontent.trim().split('#');
    for (int i = 0; i < allHadeeth.length; i++) {
      List<String> hadeethLines = allHadeeth[i].trim().split('\n');
      String title = hadeethLines[0];
      hadeethLines.removeAt(0);
      if (title.isEmpty) continue;
      String content = hadeethLines.join('\n');
      hadeeth h = hadeeth(title: title, content: content);
      hadeethFile.add(h);
    }
    hadeethList = hadeethFile;
    setState(() {});
  }
}

class hadeeth {
  String title, content;

  hadeeth({required this.title, required this.content});
}
