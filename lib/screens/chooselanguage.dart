import 'dart:async';

import 'package:app/screens/intro_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ChooseLanguage extends StatefulWidget {
  static const routeName = '/chooselanguage';

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/welcome.png'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'chooseyourlanguage'.tr(),
            ),
          ),
          ToggleSwitch(
            initialLabelIndex: 0,
            totalSwitches: 4,
            changeOnTap: true,
            inactiveBgColor: const Color.fromARGB(79, 158, 158, 158),
            labels: const [
              'english',
              'ትግርኛ',
              'አማርኛ',
              'Oromiffa',
            ],
            onToggle: (index) {
              print(index);
              if (index == 0) {
                context.setLocale(Locale('en', 'US'));
                // setState(() {});
              } else if (index == 1) {
                context.setLocale(Locale('en', 'ER'));
                // setState(() {});
              } else if (index == 2) {
                context.setLocale(Locale('am', 'ET'));
                // setState(() {});
              } else if (index == 3) {
                context.setLocale(Locale('en', 'KE'));
                // setState(() {});
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FilledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, IntroScreen.routeName);
                },
                child: Text('continue'.tr())),
          )
        ],
      ),
    );
  }
}
