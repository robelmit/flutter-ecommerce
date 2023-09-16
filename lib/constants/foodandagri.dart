import 'package:easy_localization/easy_localization.dart';

import '../models/Categorypro.dart';
import '../models/category.dart';
import 'colors.dart';



List<Category> mealsanddrinks = [];
List<Categorypro> mealsanddrinkspro = [];
List<Category> livestockandpoultry = [];
List<Categorypro> livestockandpoultrypro = [];
List<Category> feedssupplements = [];
List<Categorypro> feedssupplementspro = [];
List<Category> farmmachineryandequipment = [];
List<Categorypro> farmmachineryandequipmentpro = [];
final List<Category> foodandagri = [
  Category(
    'mealsanddrinks'.tr(),
    'assets/images/new/foodandagri/fooddrink.svg',
    kAccentGreen,
  ),
  Category(
    'livestockandpoultry'.tr(),
    'assets/images/new/foodandagri/goat.svg',
    kAccentGreen,
  ),
  Category(
    'feedssupplements'.tr(),
    'assets/images/new/foodandagri/vitamins.svg',
    kAccentPurple,
  ),
  Category(
    'farmmachineryandequipment'.tr(),
    'assets/images/new/foodandagri/tractor.svg',
    kAccentPurple,
  ),
  

];
final List<Categorypro> foodandagripro = [
    Categorypro(
    'mealsanddrinks',
    'assets/images/new/foodandagri/fooddrink.svg',
    kAccentGreen,
  ),
  Categorypro(
    'livestockandpoultry',
    'assets/images/new/foodandagri/goat.svg',
    kAccentGreen,
  ),
  Categorypro(
    'feedssupplements',
    'assets/images/new/foodandagri/vitamins.svg',
    kAccentPurple,
  ),
  Categorypro(
    'farmmachineryandequipment',
    'assets/images/new/foodandagri/tractor.svg',
    kAccentPurple,
  ),

];