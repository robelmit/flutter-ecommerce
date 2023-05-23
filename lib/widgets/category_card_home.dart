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

class CategoryCardhome extends StatelessWidget {
  final Category category;
  final Categorypro categorypro;
  //  List<Category> categorynice;
  CategoryCardhome(this.category, this.categorypro);

  // final List<Category> phone = [
  //   Category(
  //     'Samsung'.tr(),
  //     'assets/images/samsung.svg',
  //     kAccentGreen,
  //   ),
  //   Category(
  //     'iphone'.tr(),
  //     'assets/images/apple.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Nokia'.tr(),
  //     'assets/images/nokia.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Huawei'.tr(),
  //     'assets/images/huaweipro.svg',
  //     kAccentYellow,
  //   ),
  //   Category(
  //     'Xiaomi'.tr(),
  //     'assets/images/xiaomi.svg',
  //     kAccentPurple,
  //   ),
  // ];
  //   final List<Category> categories = [
  //   Category(
  //     'Samsung'.tr(),
  //     'assets/images/samsung.svg',
  //     kAccentGreen,
  //   ),
  //   Category(
  //     'iphone'.tr(),
  //     'assets/images/apple.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Nokia'.tr(),
  //     'assets/images/nokia.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Huawei'.tr(),
  //     'assets/images/huaweipro.svg',
  //     kAccentYellow,
  //   ),
  //   Category(
  //     'Xiaomi'.tr(),
  //     'assets/images/xiaomi.svg',
  //     kAccentPurple,
  //   ),
  // ];
  final List<Category> categories = [
    Category(
      'Tv'.tr(),
      'assets/images/television pro.svg',
      kAccentGreen,
    ),
    Category(
      'Video Cameras'.tr(),
      'assets/images/video.svg',
      kAccentPurple,
    ),
    Category(
      'Laptops'.tr(),
      'assets/images/laptop.svg',
      kAccentPurple,
    ),
    Category(
      'Desktops'.tr(),
      'assets/images/desktop.svg',
      kAccentPurple,
    ),
    Category(
      'Computer Accessory'.tr(),
      'assets/images/harddisk.svg',
      kAccentPurple,
    ),
    Category(
      'Headphones'.tr(),
      'assets/images/headphone.svg',
      kAccentPurple,
    ),
    Category(
      'Router'.tr(),
      'assets/images/router.svg',
      kAccentPurple,
    ),
  ];
  final List<Category> categorieshome = [
    Category(
      'Sofa'.tr(),
      'assets/images/sofa.svg',
      kAccentGreen,
    ),
    Category(
      'Fridge'.tr(),
      'assets/images/fridge.svg',
      kAccentPurple,
    ),
    Category(
      'Bed'.tr(),
      'assets/images/bed.svg',
      kAccentPurple,
    ),
    Category(
      'Microwave'.tr(),
      'assets/images/microwave.svg',
      kAccentPurple,
    ),
    Category(
      'Table'.tr(),
      'assets/images/table.svg',
      kAccentPurple,
    ),
    Category(
      'Chair'.tr(),
      'assets/images/chair.svg',
      kAccentPurple,
    ),
  ];
  final List<Category> categoriescloth = [
    Category(
      'Cloths'.tr(),
      'assets/images/sofa.svg',
      kAccentGreen,
    ),
    Category(
      'Shoe'.tr(),
      'assets/images/shoe.svg',
      kAccentPurple,
    ),
    Category(
      'Watch'.tr(),
      'assets/images/watch.svg',
      kAccentPurple,
    ),
    Category(
      'Bags'.tr(),
      'assets/images/bag.svg',
      kAccentPurple,
    ),
  ];
  // final List<Category> categories = [
  //   Category(
  //     'Toyota'.tr(),
  //     'assets/images/toyota.svg',
  //     kAccentGreen,
  //   ),
  //   Category(
  //     'Hyundai'.tr(),
  //     'assets/images/hyundai.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Suzuki'.tr(),
  //     'assets/images/suzuki.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Nissan'.tr(),
  //     'assets/images/nissan.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Ford'.tr(),
  //     'assets/images/ford.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Volswagen'.tr(),
  //     'assets/images/buses.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Buses'.tr(),
  //     'assets/images/buses.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Truck'.tr(),
  //     'assets/images/truck.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Heavy Equipment'.tr(),
  //     'assets/images/excavator.svg',
  //     kAccentPurple,
  //   ),
  // ];
  // final List<Category> categorieshome = [
  //   Category(
  //     'Apartment'.tr(),
  //     'assets/images/apartment.svg',
  //     kAccentGreen,
  //   ),
  //   Category(
  //     'House'.tr(),
  //     'assets/images/house.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Condominium'.tr(),
  //     'assets/images/apartment.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Villa'.tr(),
  //     'assets/images/villa.svg',
  //     kAccentPurple,
  //   ),
  // ];
  // final List<Category> categories = [
  //   Category(
  //     'Dogs'.tr(),
  //     'assets/images/dog.svg',
  //     kAccentGreen,
  //   ),
  //   Category(
  //     'Cats'.tr(),
  //     'assets/images/cat.svg',
  //     kAccentPurple,
  //   ),
  //   Category(
  //     'Birds'.tr(),
  //     'assets/images/bird.svg',
  //     kAccentPurple,
  //   ),

  // ];
  final List<Categorypro> categoriespro = [
    Categorypro(
      'phones'.tr(),
      'assets/images/phone.svg',
      kAccentGreen,
    ),
    Categorypro(
      'electronics'.tr(),
      'assets/images/television pro.svg',
      kAccentYellow,
    ),
    Categorypro(
      'homesupplies'.tr(),
      'assets/images/sofa.svg',
      kAccentPurple,
    ),
    Categorypro(
      'animals'.tr(),
      'assets/images/dog.svg',
      kAccentYellow,
    ),
    Categorypro(
      'fashion'.tr(),
      'assets/images/shoe.svg',
      kAccentPurple,
    ),
    Categorypro(
      'vehicles'.tr(),
      'assets/images/car.svg',
      kAccentTosca,
    ),
    Categorypro(
      'property'.tr(),
      'assets/images/house.svg',
      kAccentGreen,
    ),
    Categorypro(
      'homesupplies'.tr(),
      'assets/images/sofa.svg',
      kAccentPurple,
    ),
    Categorypro(
      'animals'.tr(),
      'assets/images/dog.svg',
      kAccentYellow,
    ),
    Categorypro(
      'fashion'.tr(),
      'assets/images/shoe.svg',
      kAccentPurple,
    ),
    Categorypro(
      'vehicles'.tr(),
      'assets/images/car.svg',
      kAccentTosca,
    ),
    Categorypro(
      'property'.tr(),
      'assets/images/house.svg',
      kAccentGreen,
    ),
  ];
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
            radius: getProportionateScreenWidth(15),
            backgroundColor: category.color,
            child: SizedBox(
              width: getProportionateScreenWidth(40),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => SubCategoryScreen(
                              catagories: categories,
                              catagoriestosend: categoriespro,
                            )),
                  );
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
