import 'package:app/models/Categorypro.dart';
import 'package:app/screens/special_deal_screen.dart';
import 'package:app/screens/subcatagory.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/animals.dart';
import '../constants/babies.dart';
import '../constants/beautyandhealth.dart';
import '../constants/commercialequipment.dart';
import '../constants/construction.dart';
import '../constants/fashion.dart';
import '../constants/foodandagri.dart';
import '../constants/homesupplies.dart';
import '../constants/jobs.dart';
import '../constants/mobileandtablets.dart';
import '../constants/property.dart';
import '../screens/detailedlist.dart';
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
                  var ph = 'phones';
                  var ele = 'electronics';
                  var veh = 'vehicles';
                  var pro = 'property';
                  var hom = 'homesupplies';
                  var fas = 'fashion';
                  var ani = 'animals';
                  if (category.catIcon == 'assets/images/phone.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: mobileandtablets,
                            catagoriestosend: mobileandtabletspro,
                            title: ph.tr())));
                  } else if (category.catIcon ==
                      'assets/images/new/electronics/tv.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: electronics,
                            catagoriestosend: electronicspro,
                            title: ele.tr())));
                  } else if (category.catIcon ==
                      'assets/images/new/homesupplies/sofa.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: homesupplies,
                            catagoriestosend: homesuppliespro,
                            title: hom.tr())));
                  } else if (category.catIcon == 'assets/images/dog.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: animalsfinal,
                            catagoriestosend: animalsfinalpro,
                            title: ani.tr())));
                  } else if (category.catIcon ==
                      'assets/images/new/fashion/tshirt.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: fashion,
                            catagoriestosend: fashionpro,
                            title: 'fashion'.tr())));
                  } else if (category.catIcon == 'assets/images/car.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: vehiclesfinal,
                            catagoriestosend: vehiclesfinalpro,
                            title: 'Vehicles'.tr())));
                  } else if (category.catIcon == 'assets/images/house.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: property,
                            catagoriestosend: propertypro,
                            title: 'property'.tr())));
                  } else if (category.catIcon ==
                      'assets/images/babe.svg') {
                              

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: babies,
                            catagoriestosend: babiespro,
                            title: 'babies'.tr())));
                  } else if (category.catIcon ==
                      'assets/images/new/foodandagri/food.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: foodandagri,
                            catagoriestosend: foodandagripro,
                            title: 'Food and agri'.tr())));
                  } else if (category.catIcon ==
                      'assets/images/job1.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: jobs,
                            catagoriestosend: jobspro,
                            title: 'Jobs'.tr())));
                  } else if (category.catIcon ==
                      'assets/images/new/commercialequipment/factory.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: commercialequipment,
                            catagoriestosend: commercialequipmentpro,
                            title: 'Commercial equipment'.tr())));
                  } else if (category.catIcon ==
                      'assets/images/new/construction/metr.svg') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailedList(
                            catagories: construction,
                            catagoriestosend: constructionpro,
                            title: 'construction'.tr())));
                  } else if (category.catIcon ==
                      'assets/images/new/beautyandhealth/hair.svg') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => DetailedList(
                              catagories: beautyandhealth,
                              catagoriestosend: beautyandhealthpro,
                              title: "beautyandhealth".tr())),
                    );
                  }
                  print(category.catIcon);
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
