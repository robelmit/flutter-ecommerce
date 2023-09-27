import 'package:app/models/Categorypro.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/category.dart';
import '../utils/screen_utils.dart';
import '../widgets/category_card.dart';
import '../widgets/custom_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category_screen';
  @override
  Widget build(BuildContext context) {
      final List<Category> categories = [
      Category(
        'mobileandtablets'.tr(),
        'assets/images/phone.svg',
        kAccentGreen,
      ),
      Category(
        'electronics'.tr(),
        'assets/images/new/electronics/tv.svg',
        kAccentYellow,
      ),
      Category(
        'vehicles'.tr(),
        'assets/images/car.svg',
        kAccentTosca,
      ),
      Category(
        'property'.tr(),
        'assets/images/house.svg',
        kAccentGreen,
      ),
            Category(
        'beautyandhealth'.tr(),
        'assets/images/new/beautyandhealth/hair.svg',
        kAccentGreen,
      ),
            Category(
        'babies'.tr(),
        'assets/images/babe.svg',
        kAccentGreen,
      ),
            Category(
        'foodandagri'.tr(),
        'assets/images/new/foodandagri/food.svg',
        kAccentGreen,
      ),
      Category(
        'homesupplies'.tr(),
        'assets/images/new/homesupplies/sofa.svg',
        kAccentPurple,
      ),
      Category(
        'fashion'.tr(),
        'assets/images/new/fashion/tshirt.svg',
        kAccentPurple,
      ),
      Category(
        'animals'.tr(),
        'assets/images/dog.svg',
        kAccentYellow,
      ),
            Category(
        'jobs'.tr(),
        'assets/images/job1.svg',
        kAccentYellow,
      ),
            Category(
        'commercialequipment'.tr(),
        'assets/images/new/commercialequipment/factory.svg',
        kAccentYellow,
      ),
            Category(
        'construction'.tr(),
        'assets/images/new/construction/metr.svg',
        kAccentYellow,
      ),
       
    ];
    final List<Categorypro> categoriestosend = [
       Categorypro(
        'mobileandtablets',
        'assets/images/phone.svg',
        kAccentGreen,
      ),
      Categorypro(
        'electronics',
        'assets/images/new/electronics/television pro.svg',
        kAccentYellow,
      ),
      Categorypro(
        'vehicles',
        'assets/images/car.svg',
        kAccentTosca,
      ),
      Categorypro(
        'property',
        'assets/images/house.svg',
        kAccentGreen,
      ),
            Categorypro(
        'beautyandhealth',
        'assets/images/new/beautyandhealth/hair.svg',
        kAccentGreen,
      ),
            Categorypro(
        'babies',
        'assets/images/new/babies/baby.svg',
        kAccentGreen,
      ),
            Categorypro(
        'foodandagri',
        'assets/images/new/foodandagri/food.svg',
        kAccentGreen,
      ),
      Categorypro(
        'homesupplies',
        'assets/images/new/homesupplies/sofa.svg',
        kAccentPurple,
      ),
      Categorypro(
        'fashion',
        'assets/images/new/fashion/tshirt.svg',
        kAccentPurple,
      ),
      Categorypro(
        'animals',
        'assets/images/dog.svg',
        kAccentYellow,
      ),
            Categorypro(
        'jobs',
        'assets/images/dog.svg',
        kAccentYellow,
      ),
            Categorypro(
        'commercialequipment',
        'assets/images/new/commercialequipment/dog.svg',
        kAccentYellow,
      ),
            Categorypro(
        'construction',
        'assets/images/new/construction/cutter.svg',
        kAccentYellow,
      ),
       
    ];
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              'Categories'.tr(),
              [
                // Icon(
                //   Icons.search,
                //   color: kPrimaryGreen,
                // ),
                // i am called robel and i am a senior software engineer with over 5 years
                // and i am trying to build an app called 
                SizedBox(
                  width: getProportionateScreenWidth(100),
                ),
              ],
              () {
               Navigator.of(context, rootNavigator: true).pop(context);
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(60),
            ),
            Expanded(
                child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: List.generate(
                categories.length,
                (index) =>
                    CategoryCard(categories[index], categoriestosend[index]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
