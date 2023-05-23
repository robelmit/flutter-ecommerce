import 'package:app/screens/login_screen.dart';
import 'package:app/screens/postad.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../screens/my_profile_screen.dart';
import '../utils/screen_utils.dart';
import '../widgets/image_container.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var name;
  var phone;
  String firsttime = '';

  @override
  void initState() {
    // TODO: implement initState
    mountask();

    super.initState();
  }

  mountask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    phone = prefs.getString('phone');
    print('check' + name);
    print('nice' + phone);
    var isloggedin = prefs.getString('id');
    print(isloggedin);
    if (isloggedin != null) {
      setState(() {
        firsttime = isloggedin;
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (firsttime.isEmpty)
        ? Container(
            child: Center(
                child: Container(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/d.png',
                    width: MediaQuery.of(context).size.width / 2),
                Text('logintoviewyourprofile'.tr(),
                    style: TextStyle(color: Colors.red.withOpacity(0.8))),
                Column(
                  children: [
                    FilledButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, SignupScreen.routeName);
                        },
                        child: Text(
                          'signup'.tr(),
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('alreadyhaveaccount'.tr(),
                          style: TextStyle(fontSize: 12.0)),
                      TextButton(
                          child: Text('login'.tr(),
                              style: TextStyle(fontSize: 12.0)),
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, LoginScreen.routeName);
                          })
                    ])
                  ],
                ),
              ],
            ))),
          )
        : Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(8.0),
                  ),
                  ImageContainer(),
                  SizedBox(
                    height: getProportionateScreenHeight(8.0),
                  ),
                  Text(
                    '$name',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    '$phone',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: kTextColorAccent,
                        ),
                  ),
                  Divider(
                    height: getProportionateScreenHeight(32.0),
                  ),
                  // ProfileCard(
                  //   image: 'assets/images/profile_user.png',
                  //   color: kAccentGreen,
                  //   title: 'My profile',
                  //   tapHandler: () {
                  //     Navigator.of(context).pushNamed(MyProfileScreen.routeName);
                  //   },
                  // ),
                  GestureDetector(
                    onDoubleTap: () {
                      print('hi there');
                    },
                    onTap: () {
                      print('hi there');
                    },
                    child: ProfileCard(
                      image: 'assets/images/profile_user.png',
                      color: kAccentGreen,
                      title: 'postanadd'.tr(),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8.0),
                  ),
                  ProfileCard(
                    image: 'assets/images/map_user.png',
                    color: kAccentTosca,
                    title: 'myaddress'.tr(),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8.0),
                  ),
                  ProfileCard(
                    image: 'assets/images/egg.png',
                    color: kAccentYellow,
                    title: 'setting'.tr(),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8.0),
                  ),
                  ProfileCard(
                    image: 'assets/images/check_user.png',
                    color: kAccentPurple,
                    title: 'helpcenter'.tr(),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8.0),
                  ),
                  ProfileCard(
                    image: 'assets/images/arrow_user.png',
                    color: kAccentRed,
                    title: 'logout'.tr(),
                  ),
                  Spacer(),
                  Text(
                    'Developed by Robel Tsegay',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: kTextColorAccent,
                        ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8.0),
                  )
                ],
              ),
            ),
          );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.image,
    required this.title,
    this.tapHandler,
    required this.color,
  }) : super(key: key);

  final String image;
  final String title;
  final Function? tapHandler;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //print('hi there bb');
        if (image == "assets/images/profile_user.png") {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => MyNewApp()));
        } else if (image == "assets/images/egg.png") {
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: Center(
                child: Column(children: [
              SizedBox(height: 10),
              Text('chooseyourlanguage'.tr()),
              SizedBox(height: 10),
              ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 3,
                changeOnTap: true,
                inactiveBgColor: const Color.fromARGB(79, 158, 158, 158),
                labels: [
                  'english',
                  'ትግርኛ',
                  'አማርኛ',
                ],
                onToggle: (index) {
                  print(index);
                  if (index == 0) {
                    context.setLocale(Locale('en', 'US'));
                  } else if (index == 1) {
                    context.setLocale(Locale('en', 'ER'));
                  } else if (index == 2) {
                    context.setLocale(Locale('am', 'ET'));
                  }
                },
              ),
            ])),
            title: 'This is Ignored',
            desc: 'This is also Ignored',
            btnOkOnPress: () {},
          )..show();
        }

        //Navigator.of(context).pushNamed(MyNewApp.routeName);
      }, //TabHandler
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(8.0),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: kShadowColor.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(8.0),
              ),
              decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(8.0),
                  ),
                ),
              ),
              child: Image.asset(image),
            ),
            SizedBox(
              width: getProportionateScreenWidth(8.0),
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
