import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeeth_tab/hadeet.dart';
import 'package:islami_app/home/hadeeth_tab/hadeethScreen.dart';

class HadeethWidget extends StatelessWidget {
  String title, content;

  HadeethWidget({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadeethScreen.routeName,
            arguments: hadeeth(title: title, content: content));
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal:
                      BorderSide(color: Theme.of(context).primaryColor))),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          )),
    );
  }
}
