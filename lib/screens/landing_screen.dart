import 'dart:async';
//import 'dart:js_interop';

import 'package:app/screens/chooselanguage.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

///best practices
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../screens/intro_screen.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = '/landing_screen';

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    mountask();

    //  new Timer(const Duration(seconds: 3), () {
    // Navigator.of(context).pushNamed(TabScreen.routeName);
    // });

    super.initState();
  }

  mountask() async {
    print('hi there ');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var language = prefs.getString('id');
    var isfirsttime = prefs.getString('firsttime');
    print(isfirsttime);
    if (isfirsttime == null) {
      print('hi');
      prefs.setString('firsttime', 'sucess');
      new Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacementNamed(ChooseLanguage.routeName);
      });
    } else {
      print(token);

      // print('token' + token!);

      if (token != null) {
        print('hi 3');

        print('bro');
        new Timer(const Duration(seconds: 3), () {
          Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
        });
      } else {
        print('hi 4');
        new Timer(const Duration(seconds: 3), () {
          Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/welcome.png',
              width: 300,
              height: 300,
              //fit: BoxFit.contain,
            ),
            //Text('cool'),
            IntroWidget(),
            //   Text('cool bro'),
          ],
        ),
      ),
    );
  }
}

class IntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'welcomeemssage'.tr(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: kTextColor,
                    //  fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'buytomillions'.tr(),
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: kTextColorAccent,
                ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(ChooseLanguage.routeName);
            },
            child: Text('getstarted'.tr()),
          ),
        ),
      ],
    );
  }
}
