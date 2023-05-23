import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class SearchBarpro extends StatefulWidget {
  final String hint;
  final Function onChanged; 


  const SearchBarpro({required this.hint,required this.onChanged});

  @override
  State<SearchBarpro> createState() => _SearchBarproState();
}

class _SearchBarproState extends State<SearchBarpro> {
  @override
  Widget build(BuildContext context) {
    return TextField(
    //  onChanged:onChanged ,
      decoration: InputDecoration(
        filled: true,
        fillColor: kFillColorThird,
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.filter_alt),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintText: widget.hint,
        contentPadding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(
            10,
          ),
        ),
        hintStyle: TextStyle(
          color: kGreyShade2,
          //fontSize: getProportionateScreenWidth(17),
        ),
      ),
      style: TextStyle(
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
