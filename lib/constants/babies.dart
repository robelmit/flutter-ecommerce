import 'package:easy_localization/easy_localization.dart';

import '../models/Categorypro.dart';
import '../models/category.dart';
import 'colors.dart';

final List<Category> babyandchildcare = [];
final List<Categorypro> babyandchildcarepro = [];
final List<Category> childrenclothing = [];
final List<Category> childrenclothingpro = [];
final List<Categorypro> childreshoe = [];
final List<Categorypro> childreshoepro = [];
final List<Category> toys = [];
final List<Category> toyspro = [];
final List<Category> babies = [
  Category(
    'babyandchildcare'.tr(),
    'assets/images/babe.svg',
    kAccentGreen,
  ),
  Category(
    'childrenclothing'.tr(),
    'assets/images/new/babies/babycloth.svg',
    kAccentGreen,
  ),
  Category(
    'childreshoe'.tr(),
    'assets/images/new/babies/babyshoe.svg',
    kAccentPurple,
  ),
  Category(
    'toys'.tr(),
    'assets/images/new/babies/toy.svg',
    kAccentPurple,
  ),
];
final List<Categorypro> babiespro = [
    Categorypro(
    'babyandchildcare',
    'assets/images/new/babies/baby.svg',
    kAccentGreen,
  ),
  Categorypro(
    'childrenclothing',
    'assets/images/new/babies/babycloth.svg',
    kAccentGreen,
  ),
  Categorypro(
    'childreshoe',
    'assets/images/new/babies/babyshoe.svg',
    kAccentPurple,
  ),
  Categorypro(
    'toys',
    'assets/images/new/babies/toy.svg',
    kAccentPurple,
  ),
];
