import 'package:easy_localization/easy_localization.dart';

import '../models/Categorypro.dart';
import '../models/category.dart';
import 'colors.dart';



final List<Category> clothing = [];
final List<Categorypro> clothingpro = [];
final List<Category> shoes = [];
final List<Categorypro> shoespro = [];
final List<Category> bags = [];
final List<Categorypro> bagspro = [];
final List<Category> jewelry = [];
final List<Categorypro> jewelrypro = [];
final List<Category> watches = [];
final List<Categorypro> watchespro = [];
final List<Category> fashion = [
  Category(
    'clothing'.tr(),
    'assets/images/new/fashion/tshirt.svg',
    kAccentGreen,
  ),
  Category(
    'shoes'.tr(),
    'assets/images/new/fashion/shoes.svg',
    kAccentGreen,
  ),
  Category(
    'bags'.tr(),
    'assets/images/new/fashion/bag.svg',
    kAccentPurple,
  ),
  Category(
    'jewelry'.tr(),
    'assets/images/new/fashion/jewelry.svg',
    kAccentPurple,
  ),
   Category(
    'watches'.tr(),
    'assets/images/new/fashion/smart-watch.svg',
    kAccentPurple,
  ),
];
final List<Categorypro> fashionpro = [
    Categorypro(
    'clothing',
    'assets/images/new/fashion/tshirt.svg',
    kAccentGreen,
  ),
  Categorypro(
    'shoes',
    'assets/images/new/fashion/shoes.svg',
    kAccentGreen,
  ),
  Categorypro(
    'bags',
    'assets/images/new/fashion/bag.svg',
    kAccentPurple,
  ),
  Categorypro(
    'jewelry',
    'assets/images/new/fashion/jewelry.svg',
    kAccentPurple,
  ),
   Categorypro(
    'watches',
    'assets/images/new/fashion/smart-watch.svg',
    kAccentPurple,
  ),
];