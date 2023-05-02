import 'dart:async';

import 'package:app/screens/home_screen.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///best practices
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../screens/intro_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    mountask();

    super.initState();
  }

  mountask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token' + token!);
    if (token!.isNotEmpty) {
      print('bro');
      new Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushNamed(TabScreen.routeName);
      });
      // Navigator.of(context).pushNamed(LoginScreen.routeName);
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
          children: [
            Text(
              'Welcome to Veggie Fresh',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: kTextColor,
                    //  fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'We have more than 10,000+ food available for all of you.',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: kTextColorAccent,
              ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(IntroScreen.routeName);
            },
            child: Text('Get Started'),
          ),
        ),
      ],
    );
  }
}
