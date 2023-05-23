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
        'phones'.tr(),
        'assets/images/phone.svg',
        kAccentGreen,
      ),
      Category(
        'electronics'.tr(),
        'assets/images/television pro.svg',
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
        'homesupplies'.tr(),
        'assets/images/sofa.svg',
        kAccentPurple,
      ),
      Category(
        'fashion'.tr(),
        'assets/images/shoe.svg',
        kAccentPurple,
      ),
      Category(
        'animals'.tr(),
        'assets/images/dog.svg',
        kAccentYellow,
      ),
    ];
    final List<Categorypro> categoriestosend = [
      Categorypro(
        'phones',
        'assets/images/phone.svg',
        kAccentGreen,
      ),
      Categorypro(
        'electronics',
        'assets/images/television pro.svg',
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
        'homesupplies',
        'assets/images/sofa.svg',
        kAccentPurple,
      ),
      Categorypro(
        'fashion',
        'assets/images/shoe.svg',
        kAccentPurple,
      ),
      Categorypro(
        'animals',
        'assets/images/dog.svg',
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
