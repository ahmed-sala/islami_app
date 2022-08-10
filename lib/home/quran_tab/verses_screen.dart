import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
  int index;
  String title;

  VerseWidget({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        '{${index}}' + title,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
    ;
  }
}
