import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';
import '../widgets/back_button_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final Function()? onpressed;

  const CustomAppBar(this.title, this.actions, this.onpressed);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: onpressed,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(17),
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end, children: actions),
          ),
        ],
      ),
    );
  }
}
