import 'package:app/screens/home_screen.dart';
import 'package:app/services/api.dart';
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

class SignupScreen extends StatefulWidget {
  static const routeName = '/signupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var isloading = false;




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
            BackButtonLS(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sign Up Continue!',
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
                      CustomTextField(
                        controller1: name,
                        hint: 'Your Name',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 24,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      CustomTextField(
                        controller1: phone,
                        hint: 'Phone Number',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 24,
                        ),
                      ),

                      SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                        controller1: email,
                        hint: 'Email Address',
                        icon: Icon(Icons.abc),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                        controller1: password,
                        hint: 'Password',
                        icon: Image.asset('assets/images/hide_icon.png'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .pushNamed(AddAddressScreen.routeName);
                          var api = new Api();
                          setState(() {
                            isloading = true;
                          });

                          api.Register(name.text, phone.text, email.text,
                                  password.text)
                              .then((value) => {
                                    setState(() {
                                      isloading = false;
                                      Navigator.of(context)
                                          .pushNamed(LoginScreen.routeName);
                                    })
                                  });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Sign Up'),
                              SizedBox(width: 14.0),
                              isloading
                                  ? Container(
                                      margin: const EdgeInsets.all(0.0),
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      ),
                                    )
                                  : SizedBox()
                            ]),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          OptionButton(
                            desc: 'Have an account? ',
                            method: 'Login',
                            onPressHandler: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
                            },
                          ),
                        ],
                      )
                      //   Spacer(),
                    ],
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
