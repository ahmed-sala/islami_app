import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class radio_tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Image.asset('assets/images/radio.png'),
          ),
          Expanded(
            child: Text('اذاعة القران الكريم',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: settingsProvider.isDark()
                          ? Colors.white
                          : Colors.black,
                    )),
          ),
          Expanded(
            child: Container(
              width: size.width * 0.6,
              margin: EdgeInsets.only(bottom: 80),
              child: Row(
                children: [
                  Expanded(
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/back_icon.png',
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                    child: ImageIcon(
                      AssetImage('assets/images/pause_icon.png'),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                    child: ImageIcon(
                      AssetImage('assets/images/forward_icon.png'),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
