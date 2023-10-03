import 'package:app/screens/tab_screen.dart';
import 'package:app/screens/update_password.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api.dart';
import '../widgets/profileitems.dart';
import 'myadds.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var name = '';
  var phone = '';
  var email = '';
  String firsttime = '';
  var api = Api();

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
    name = prefs.getString('name')!;
    phone = prefs.getString('phone')!;
    email = prefs.getString('email')!;
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
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title:
            Text('Profile'.tr(), style: Theme.of(context).textTheme.headline4),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage('assets/images/user.png'))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).primaryColor),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(name, style: Theme.of(context).textTheme.labelLarge),
              Text(phone, style: Theme.of(context).textTheme.headlineMedium),
              Text(email, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20),

              /// -- BUTTON
              // SizedBox(
              //   width: 200,
              //   child: ElevatedButton(
              //     onPressed: () => {},
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: Theme.of(context).primaryColor,
              //         side: BorderSide.none,
              //         shape: const StadiumBorder()),
              //     child: const Text('tEditProfile',
              //         style: TextStyle(color: Colors.black)),
              //   ),
              // ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "My Adds".tr(),
                  icon: LineAwesomeIcons.car,
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyAdds()));
                  }),
              ProfileMenuWidget(
                  title: "Change Password".tr(),
                  icon: LineAwesomeIcons.cog,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword()));
                  }),

              ProfileMenuWidget(
                  title: "Logout".tr(),
                  icon: LineAwesomeIcons.alternate_sign_out,
                  onPress: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.pushReplacementNamed(
                        context, TabScreen.routeName);
                  }),
              ProfileMenuWidget(
                  title: "Delete Account".tr(),
                  icon: LineAwesomeIcons.trash,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.error,
                      title: 'Are you sure to delete your account'.tr(),
                      desc:
                          'Deleting an account will remove all your data from  ezana '
                              .tr(),
                      btnOkText: 'ok'.tr(),
                      btnCancelText: 'cancel'.tr(),
                      btnOkOnPress: () async{
                        api.deleteaccount(firsttime);
                         SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                       prefs.clear();

                        Navigator.pushReplacementNamed(context, TabScreen.routeName);
                      },
                      btnCancelOnPress: () {
                        // Navigator.pushReplacementNamed(context, TabScreen.routeName);
                      },
                    ).show();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
