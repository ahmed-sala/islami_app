import 'package:flutter/material.dart';
import 'package:islami_app/home/quran_tab/sura_details.dart';

class SuraNameWidget extends StatelessWidget {
  String title;
  int index;

  SuraNameWidget({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(title: title, index: index));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
