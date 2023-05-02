import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hint,
    required this.icon,
    required this.controller1
  });
  final String hint;
  final Widget icon;
  final TextEditingController controller1;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller1,
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
