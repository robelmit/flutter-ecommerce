import 'package:app/screens/tab_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../utils/screen_utils.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/introScreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int pageCount = 0;

  final PageController _controller = PageController();

  void setPageCount(int aPageCount) {
    setState(() {
      pageCount = aPageCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            IllustrationPageView(_controller, setPageCount),
            TextView(pageCount),
          ],
        ),
      ),
    );
  }
}

class TextView extends StatelessWidget {
  final int pageCount;

  const TextView(this.pageCount);
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> data;
    if (context.locale == Locale('en', 'US')) {
      data = [
        {
          'title': 'Easy',
          'desc': 'Using this app you can buy reused products easily',
        },
        {
          'title': 'Interactive',
          'desc': 'Connect with sellers around your area interactively',
        },
        {
          'title': 'Modern',
          'desc': 'find all of the products that you want in your phone',
        },
      ];
    } else if (context.locale == Locale('en', 'ER')) {
      data = [
        {
          'title': 'ቀሊል',
          'desc': 'በዚ መተግበሪ ተጠቂሞም ዘገልገሉ ኣቁሑት ይግዝኡ',
        },
        {
          'title': 'መራከቢ',
          'desc': 'ምስ ኣብ ከባቢኦም ዘለዉ ሽየጥቲ ይራከቡ',
        },
        {
          'title': 'ዘመናዊ',
          'desc': 'ዝደለይዎ ኣቁሑት ብሞባይሎም ተጠቂሞም ዝደልይዎ ኣቁሑት ይግዝኡ',
        },
      ];
    } else if (context.locale == Locale('am', 'ET')) {
      data = [
        {
          'title': 'ቀላል',
          'desc': 'ይሄን መተግበርያ በመጠቀም በቀላሉ ያገለገሉ እቃዎች መግዛት እና መሽጥ ይችላሉ ',
        },
        {
          'title': 'አገናኝ',
          'desc': 'በኣከባቢዎ ካሉ ሻጮች በቀላሉ መገናኘት ይችላሉ',
        },
        {
          'title': 'ዘመናዊ',
          'desc': 'የሚፈሉግትን ዕቃ ሞባይልዎን በመጠቀም በቀላሉ ይግዙ',
        },
      ];
    } else {
      data = [
        {
          'title': 'Easy',
          'desc': 'Using this app you can buy reused products easily',
        },
        {
          'title': 'Interactive',
          'desc': 'Connect with sellers around your area interactively',
        },
        {
          'title': 'Modern',
          'desc': 'find all of the products that you want in your phone',
        },
      ];
    }

    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            Spacer(),
            Text(
              data[pageCount]['title']!,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: kTextColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Spacer(),
            Text(
              data[pageCount]['desc']!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextColorAccent,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageIndicator(pageCount, 0),
                SizedBox(
                  width: getProportionateScreenWidth(8),
                ),
                PageIndicator(pageCount, 1),
                SizedBox(
                  width: getProportionateScreenWidth(8),
                ),
                PageIndicator(pageCount, 2),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
              },
              child: Text(
                'getstarted'.tr(),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator(this.pageCount, this.index);

  final int pageCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 300,
      ),
      width: pageCount == index
          ? getProportionateScreenWidth(32)
          : getProportionateScreenWidth(8),
      height: getProportionateScreenWidth(8),
      decoration: BoxDecoration(
        color: pageCount == index ? kPrimaryGreen : kFillColorPrimary,
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(4),
        ),
      ),
    );
  }
}

class IllustrationPageView extends StatelessWidget {
  final controller;
  final Function(int) callback;

  const IllustrationPageView(
    this.controller,
    this.callback,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        color: kAccentGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: Text(
                    'skip'.tr(),
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: kTextColor,
                        ),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (pageNum) {
                  callback(pageNum);
                },
                children: [
                  Image.asset(
                    'assets/images/bro1.png',
                  ),
                  Image.asset(
                    'assets/images/bro2.png',
                  ),
                  Image.asset(
                    'assets/images/bro5.png',
                  )
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}
