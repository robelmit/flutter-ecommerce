import 'package:app/screens/home_screen.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:app/services/api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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

class SignupScreen extends StatefulWidget {
  static const routeName = '/signupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var isloading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    final name = TextEditingController();
    final phone = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
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
                              'signuptocontinue'.tr(),
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
                          controller1: name,
                          hint: 'name'.tr(),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24,
                          ),
                          validator: (val) {
                            var nameRegExp = new RegExp(
                                r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
                            if (val!.length >= 5) {
                            } else {
                              return "entervalidname".tr();
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        CustomTextField(
                          controller1: phone,
                          hint: 'phonenumber'.tr(),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24,
                          ),
                          validator: (val) {
                            var passwordRegExp = RegExp(r"[0-9]{10}$");
                            if (passwordRegExp.hasMatch(val!)) {
                            } else {
                              return 'entervalidphone'.tr();
                            }
                          },
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller1: email,
                          hint: 'email'.tr(),
                          icon: Icon(Icons.abc),
                          validator: (val) {
                            var passwordRegExp = RegExp(
                                r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (passwordRegExp.hasMatch(val!)) {
                            } else {
                              return 'entervalidemail'.tr();
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller1: password,
                          hint: 'password'.tr(),
                          icon: Image.asset('assets/images/hide_icon.png'),
                          validator: (val) {
                            var passwordRegExp = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
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
                              EasyLoading.show(status: 'loading'.tr());

                              var api = new Api();
                              setState(() {
                                isloading = true;
                              });

                              api.Register(name.text, phone.text, email.text,
                                      password.text)
                                  .then((value) => {
                                        EasyLoading.dismiss(),
                                        setState(() {
                                          isloading = false;
                                          Navigator.of(context)
                                              .pushNamed(LoginScreen.routeName);
                                        })
                                      });
                            }
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('signup'.tr()),
                                SizedBox(width: 14.0),
                              ]),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            OptionButton(
                              desc: 'haveanaccount'.tr(),
                              method: 'login'.tr(),
                              onPressHandler: () {
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName);
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, TabScreen.routeName);
                              },
                              child: Text('skip'.tr())),
                        )
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
