import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeeth_tab/hadeet.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class HadeethScreen extends StatelessWidget {
  static const String routeName = 'hadeeth';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as hadeeth;
    var provider = Provider.of<SettingProvider>(context);

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
        body: Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).backgroundColor,
            ),
            child: Text(
              args.content,
              style: Theme.of(context).textTheme.bodyText1,
            )),
      ),
    );
  }
}
