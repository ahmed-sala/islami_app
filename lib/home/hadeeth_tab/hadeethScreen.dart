import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeeth_tab/hadeet.dart';

class HadeethScreen extends StatelessWidget {
  static const String routeName = 'hadeeth';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as hadeeth;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Text(args.content)),
      ),
    );
  }
}
