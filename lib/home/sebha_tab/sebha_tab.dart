import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class sebhaTab extends StatefulWidget {
  @override
  State<sebhaTab> createState() => _sebhaTabState();
}

class _sebhaTabState extends State<sebhaTab> {
  double angleRotate = 0;
  int counter = 0;
  int currentIndex = 0;
  List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * .45,
            child: Stack(
              children: [
                Positioned(
                    left: size.width * .48,
                    child: Image.asset(settingsProvider.getmainSebhaHead())),
                Positioned(
                  top: 80,
                  left: size.width * .21,
                  right: size.width * .21,
                  child: InkWell(
                    onTap: onPressed,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Transform.rotate(
                      angle: angleRotate,
                      child: Image.asset(settingsProvider.getmainSebhaBody()),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            AppLocalizations.of(context)!.noOfTasbeh,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).primaryColor),
            child: Text(
              '$counter',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 135,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).primaryColor),
            child: Text(
              '${azkar[currentIndex]}',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                    color:
                        settingsProvider.isDark() ? Colors.black : Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  onPressed() {
    angleRotate -= 10;
    counter++;
    if (counter == 34) {
      currentIndex++;
      counter = 0;
    }
    if (currentIndex > azkar.length - 1) {
      currentIndex = 0;
    }
    setState(() {});
  }
}
