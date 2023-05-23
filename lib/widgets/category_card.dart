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
import '../constants/lists.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Categorypro categorypro;
  //  List<Category> categorynice;
  CategoryCard(this.category, this.categorypro);

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
              width: getProportionateScreenWidth(60),
              child: GestureDetector(
                onTap: () {
                  if (category.catIcon == 'assets/images/phone.svg') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => SubCategoryScreen(
                                catagories: phone,
                                catagoriestosend: phonepro,
                              )),
                    );
                  } else if (category.catIcon ==
                      'assets/images/television pro.svg') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => SubCategoryScreen(
                                catagories: electronics,
                                catagoriestosend: electronicspro,
                              )),
                    );
                  } else if (category.catIcon == 'assets/images/sofa.svg') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => SubCategoryScreen(
                                catagories: homesupply,
                                catagoriestosend: homesupplypro,
                              )),
                    );
                  } else if (category.catIcon == 'assets/images/dog.svg') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => SubCategoryScreen(
                                catagories: animals,
                                catagoriestosend: animalspro,
                              )),
                    );
                  } else if (category.catIcon == 'assets/images/shoe.svg') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => SubCategoryScreen(
                                catagories: cloth,
                                catagoriestosend: clothpro,
                              )),
                    );
                  } else if (category.catIcon == 'assets/images/car.svg') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => SubCategoryScreen(
                                catagories: vehicles,
                                catagoriestosend: vehiclespro,
                              )),
                    );
                  } else if (category.catIcon == 'assets/images/house.svg') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => SubCategoryScreen(
                                catagories: house,
                                catagoriestosend: housepro,
                              )),
                    );
                  }
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
