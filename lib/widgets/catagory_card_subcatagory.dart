import 'package:app/models/Categorypro.dart';
import 'package:app/screens/special_deal_screen.dart';
import 'package:app/screens/subcatagory.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/screen_utils.dart';
import '../models/category.dart';
import '../constants/colors.dart';
import '../models/category.dart';

class CategoryCardsubcatagory extends StatelessWidget {
  final Category category;
  final Categorypro categorypro;
  //  List<Category> categorynice;
  CategoryCardsubcatagory(this.category, this.categorypro);

  //List<Categorypro> categorypronice;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: getProportionateScreenWidth(30),
            backgroundColor: category.color,
            child: SizedBox(
              width: getProportionateScreenWidth(40),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SpecialDealScreen(
                            catagory: categorypro.catName,
                            catagory1: category.catName,
                          )));
                },
                child: SvgPicture.asset(
                  category.catIcon,
                  //colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                  width: getProportionateScreenWidth(40),

                  // fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    category.catName)),
          )
        ],
      ),
    );
  }
}
