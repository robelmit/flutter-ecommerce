import 'package:app/screens/home_screen.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:app/services/api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/add_address_screen.dart';
import '../screens/login_screen.dart';

import '../utils/screen_utils.dart';
import '../widgets/back_button_ls.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/option_button.dart';
import '../widgets/or_row.dart';
import '../widgets/social_media.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ChangePassword extends StatefulWidget {
  static const routeName = '/signupScreen';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var isloading = false;
  final _formKey = GlobalKey<FormState>();
  final current = TextEditingController();
  final newpassword = TextEditingController();
  final retypepassword = TextEditingController();
  @override
  void dispose() {
    current.clear();
    newpassword.clear();
    retypepassword.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pushReplacementNamed(context, TabScreen.routeName);
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Changeyourpassword'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller1: current,
                          shouldobscure: true,
                          hint: 'currentpassword'.tr(),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24,
                          ),
                          validator: (val) {
                            var nameRegExp = new RegExp(
                                r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
                            if (val!.length > 4) {
                            } else {
                              return "entervalidpassword".tr();
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        CustomTextField(
                          controller1: newpassword,
                          shouldobscure: true,
                          hint: 'newpassword'.tr(),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24,
                          ),
                          validator: (val) {
                            var passwordRegExp = RegExp(r"[0-9]{10}$");
                            if (val!.length >= 5) {
                            } else {
                              return "entervalidpassword".tr();
                            }
                          },
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller1: retypepassword,
                          shouldobscure: true,
                          hint: 'reenterpassword'.tr(),
                          icon: Icon(Icons.abc),
                          validator: (val) {
                            var passwordRegExp = RegExp(
                                r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (val!.length >= 5) {
                            } else {
                              return "entervalidpassword".tr();
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        ElevatedButton(
                          onPressed: () {
                            // Navigator.of(context)
                            //     .pushNamed(AddAddressScreen.routeName);
                            if (_formKey.currentState!.validate()) {
                              if (newpassword.text != retypepassword.text) {
                                Fluttertoast.showToast(
                                    msg: "passworddontmatch".tr(),
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                return;
                              }

                              else {
                              EasyLoading.show(status: 'loading'.tr());

                           var api = new Api();
                              setState(() {
                                isloading = true;
                              });

                              api
                                  .changepassword(
                                    current.text,
                                    newpassword.text,
                                    retypepassword.text,
                                  )
                                  .then((value) => {
                                        EasyLoading.dismiss(),
                                        setState(() async {
                                          isloading = false;
                                          SharedPreferences prefs =
                                              await SharedPreferences.getInstance();
                                          prefs.clear();

                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  LoginScreen.routeName);
                                          Fluttertoast.showToast(
                                              msg: "passwordchangedsuccessfully"
                                                  .tr(),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.SNACKBAR,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          return;
                                        })
                                      })
                                  .onError((error, stackTrace) => {
                                        EasyLoading.dismiss(),
                                        Fluttertoast.showToast(
                                            msg:
                                                "an error occured during password change"
                                                    .tr(),
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.SNACKBAR,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0)
                                      });
                              }

   
                            }
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('changepassword'.tr()),
                                SizedBox(width: 14.0),
                              ]),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        //   Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
