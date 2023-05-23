import 'package:app/models/Categorypro.dart';
import 'package:app/widgets/catagory_card_subcatagory.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/category.dart';
import '../utils/screen_utils.dart';
import '../widgets/category_card.dart';
import '../widgets/custom_app_bar.dart';

class SubCategoryScreen extends StatefulWidget {
  static const routeName = '/sub_category_screen';
  late List<Category> catagories;

  late List<Categorypro> catagoriestosend;
  SubCategoryScreen(
      {Key? key, required this.catagories, required this.catagoriestosend});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    // final List<Category> categories = [
    //   Category(
    //     'phones'.tr(),
    //     'assets/images/phone.svg',
    //     kAccentGreen,
    //   ),
    //   Category(
    //     'electronics'.tr(),
    //     'assets/images/television pro.svg',
    //     kAccentYellow,
    //   ),
    //   Category(
    //     'homesupplies'.tr(),
    //     'assets/images/sofa.svg',
    //     kAccentPurple,
    //   ),
    //   Category(
    //     'animals'.tr(),
    //     'assets/images/dog.svg',
    //     kAccentYellow,
    //   ),
    //   Category(
    //     'fashion'.tr(),
    //     'assets/images/shoe.svg',
    //     kAccentPurple,
    //   ),
    //   Category(
    //     'vehicles'.tr(),
    //     'assets/images/car.svg',
    //     kAccentTosca,
    //   ),
    //   Category(
    //     'property'.tr(),
    //     'assets/images/house.svg',
    //     kAccentGreen,
    //   ),
    // ];

    // final List<Categorypro> categoriestosend = [
    //   Categorypro(
    //     'Phones',
    //     'assets/images/phone.svg',
    //     kAccentGreen,
    //   ),
    //   Categorypro(
    //     'Cameras',
    //     'assets/images/camera.svg',
    //     kAccentYellow,
    //   ),
    //   Categorypro(
    //     'Tv',
    //     'assets/images/tele.svg',
    //     kAccentYellow,
    //   ),
    //   Categorypro(
    //     'Laptop',
    //     'assets/images/laptop.svg',
    //     kAccentYellow,
    //   ),
    //   Categorypro(
    //     'Electronics',
    //     'assets/images/fridge.svg',
    //     kAccentPurple,
    //   ),
    //   Categorypro(
    //     'Books',
    //     'assets/images/book.svg',
    //     kAccentTosca,
    //   ),
    //   Categorypro(
    //     'Motor Bike',
    //     'assets/images/motorcycle.svg',
    //     kAccentGreen,
    //   ),
    //   Categorypro(
    //     'Cars',
    //     'assets/images/car.svg',
    //     kAccentRed,
    //   ),
    //   Categorypro(
    //     'Houses',
    //     'assets/images/house.svg',
    //     kAccentRed,
    //   ),
    //   Categorypro(
    //     'Others',
    //     'assets/images/laptop.svg',
    //     kAccentPurple,
    //   ),
    // ];
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              'Sub Categories'.tr(),
              [
                // Icon(
                //   Icons.search,
                //   color: kPrimaryGreen,
                // ),
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
                widget.catagories.length,
                (index) => CategoryCardsubcatagory(
                    widget.catagories[index], widget.catagoriestosend[index]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
