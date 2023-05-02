import 'package:app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/tab_screen.dart';
import '../screens/home_screen.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    //mountask();

    super.initState();
  }

  mountask(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);

    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonLS(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Log In Continue!',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
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
                        'Forgot Password?',
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
                      // Navigator.of(context).pushNamed(TabScreen.routeName);
                      var api = new Api();
                      api
                          .login(phone.text, password.text)
                          .then((value) => {mountask(value['token'])});
                    },
                    child: Text('Login bro'),
                  ),
                  OptionButton(
                    desc: 'Don\'t have an account? ',
                    method: 'Sign Up',
                    onPressHandler: () {
                      Navigator.of(context).pushNamed(SignupScreen.routeName);
                    },
                  ),
                ],
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
          hint: 'Phone',
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 24,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(16),
        ),

        CustomTextField(
          controller1: password,
          hint: 'Password',
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 24,
          ),
        ),
      ],
    );
  }
}
