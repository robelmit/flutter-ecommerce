import 'package:app/screens/login_screen.dart';
import 'package:app/screens/map_screen.dart';
import 'package:app/screens/postad.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/screens/tab_screen.dart';
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
import '../services/api.dart';

var location;
var islocationsaved;
var api = Api();

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

  @override
  void dispose() {
    super.dispose();
  }

  mountask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    phone = prefs.getString('phone');
    location = prefs.getString('latitude');
    islocationsaved = prefs.getString('latitude');
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
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    height: (MediaQuery.of(context).size.height) / 2,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    color: Color.fromARGB(15, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'logintoviewyourprofile'.tr(),
                        ),
                        Image.asset('assets/images/d.png',
                            width: MediaQuery.of(context).size.width / 2),
                        Column(
                          children: [
                            FilledButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(
                                      context, SignupScreen.routeName);
                                },
                                child: Text(
                                  'signup'.tr(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                )),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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

class ProfileCard extends StatefulWidget {
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
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //print('hi there bb');
        if (widget.image == "assets/images/profile_user.png") {
          if (islocationsaved == null) {
            api.islocationsaved().then((value) => {
 Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MapScreen()))
            });
           
          } else
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MyNewApp()));
        } else if (widget.image == "assets/images/egg.png") {
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
        } else if (widget.image == "assets/images/arrow_user.png") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacementNamed(context, TabScreen.routeName);
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
                color: widget.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(8.0),
                  ),
                ),
              ),
              child: Image.asset(widget.image),
            ),
            SizedBox(
              width: getProportionateScreenWidth(8.0),
            ),
            Expanded(
              child: Text(
                widget.title,
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
