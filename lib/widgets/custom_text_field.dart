import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hint,
    required this.icon,
    required this.controller1,
    required this.validator,
    this.shouldobscure
  });
  final String hint;
  final Widget icon;
  final TextEditingController controller1;
  final String? Function(String?) validator;
  final bool? shouldobscure;
//static String? (String? value) validator

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      obscureText: shouldobscure ?? false,
      validator: validator,
      decoration: InputDecoration(
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(0.1),
          ),
          borderSide: BorderSide(
            color: kGreyShade3,
          ),
        ),
        
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(0.1),
          ),
          borderSide: BorderSide(
            color: kGreyShade3,
          ),
        ),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
              color: kGreyShade3,
            ),
        suffixIcon: icon,
      ),
    );
  }
}
