import 'package:app/screens/chatscreen.dart';
import 'package:app/screens/checkpayment.dart';
import 'package:app/screens/chooselanguage.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/landing_screen.dart';
import 'package:app/screens/postad.dart';
import 'package:flutter/material.dart';

import '../screens/intro_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/add_address_screen.dart';
import '../screens/map_screen.dart';
import '../screens/search_screen.dart';
import '../screens/vegetable_screen.dart';
import '../screens/fruit_screen.dart';
import '../screens/fav_screen.dart';
import '../screens/category_screen.dart';
import '../screens/popular_deals_screen.dart';
import '../screens/special_deal_screen.dart';
import '../screens/special_deal_child_screen.dart';
import '../screens/search_fruit_screen.dart';
import '../screens/addview.dart';
import '../screens/order_summary_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/order_success_screen.dart';
import '../screens/tab_screen.dart';
import '../screens/my_profile_screen.dart';

class Route {
  Map<String, Widget Function(BuildContext)> routes = {
    IntroScreen.routeName: (ctx) => IntroScreen(),
    ChooseLanguage.routeName: (ctx) => ChooseLanguage(),
    LoginScreen.routeName: (ctx) => LoginScreen(),
    SignupScreen.routeName: (ctx) => SignupScreen(),
    AddAddressScreen.routeName: (ctx) => AddAddressScreen(),
    MapScreen.routeName: (ctx) => MapScreen(),
    TabScreen.routeName: (ctx) => TabScreen(),
    SearchScreen.routeName: (ctx) => SearchScreen(),
    VegetableScreen.routeName: (ctx) => VegetableScreen(),
    FruitScreen.routeName: (ctx) => FruitScreen(),
    CategoryScreen.routeName: (ctx) => CategoryScreen(),
    PopularDealsScreen.routeName: (ctx) => PopularDealsScreen(),
    //SpecialDealScreen.routeName: (ctx) => SpecialDealScreen(),
    SpecialDealChildScreen.routeName: (ctx) => SpecialDealChildScreen(),
    SearchFruitScreen.routeName: (ctx) => SearchFruitScreen(),
    //  DragonFruitScreen.routeName: (ctx,id) => DragonFruitScreen(),
    OrderSummaryScreen.routeName: (ctx) => OrderSummaryScreen(),
    CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
    OrderSuccessScreen.routeName: (ctx) => OrderSuccessScreen(),
    MyProfileScreen.routeName: (ctx) => MyProfileScreen(),
    TabScreen.routeName: (ctx) => TabScreen(),
    LandingScreen.routeName: (ctx) => LandingScreen(),
    MyNewApp.routeName: (ctx) => MyNewApp(),
    // Checker.routeName: (ctx) => Checker(),
    // Checker.routeName: (ctx) => Checker(),
    // FavScreen.routeName: (ctx) => FavScreen()
    // ChatDetail.routeName: (ctx) => ChatDetail(),
  };
}
