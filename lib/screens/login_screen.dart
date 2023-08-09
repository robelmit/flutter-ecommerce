import 'package:app/services/api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/tab_screen.dart';
import '../screens/home_screen.dart';

import './signup_screen.dart';
import './signup_screen.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/back_button_ls.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/option_button.dart';
import '../widgets/or_row.dart';
import '../widgets/social_media.dart';

final phone = TextEditingController();
final password = TextEditingController();

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    //mountask();

    super.initState();
  }

  @override
  void dispose() {
    phone.clear();
    password.clear();
    super.dispose();
  }

  mountask(token, name, phonenumber, id) async {
    print('check');
    print(id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('name', name);
    prefs.setString('phone', phonenumber);
    prefs.setString('id', id);
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'logintocontinue'.tr(),
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    OrRow(),
                    TextFields(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'forgotpassword'.tr(),
                          style: TextStyle(
                            color: kPrimaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // print('cool');
                        if (_formKey.currentState!.validate()) {
                          EasyLoading.show(status: 'loading'.tr());

                          var api = new Api();
                          api
                              .login(phone.text, password.text)
                              .then((value) => {
                                    print('value'),
                                    print(value['_id']),
                                    mountask(value['token'], value['name'],
                                        value['phoneNumber'], value['_id']),
                                    Navigator.of(context).pushReplacementNamed(
                                        TabScreen.routeName),
                                    EasyLoading.dismiss()
                                  })
                              .onError((error, stackTrace) => {
                                    EasyLoading.dismiss(),
                                    Fluttertoast.showToast(
                                        msg: "an error occured during login"
                                            .tr(),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.SNACKBAR,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0)
                                  });
                        }
                      },
                      child: Text('login'.tr()),
                    ),
                    OptionButton(
                      desc: 'donthaveaccount'.tr(),
                      method: 'signup'.tr(),
                      onPressHandler: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignupScreen.routeName);
                      },
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class TextFields extends StatelessWidget {
  const TextFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CustomTextField(
        //   hint: 'Email Address',
        // ),
        SizedBox(
          height: getProportionateScreenHeight(16),
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
          height: getProportionateScreenHeight(16),
        ),

        CustomTextField(
          controller1: password,
          hint: 'password'.tr(),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 24,
          ),
          validator: (val) {
            var passwordRegExp = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
            if (val!.length >= 5) {
            } else {
              return "entervalidpassword".tr();
            }
          },
        ),
      ],
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool? get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
