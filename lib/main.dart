import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/category_screen.dart';
import 'package:app/screens/checkout_screen.dart';
import 'package:app/screens/chooselanguage.dart';
import 'package:app/screens/dragon_fruit_screen.dart';
import 'package:app/screens/fav_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/order_summary_screen.dart';
import 'package:app/screens/popular_deals_screen.dart';
import 'package:app/screens/search_screen.dart';
import 'package:app/screens/special_deal_screen.dart';
import 'package:app/screens/user_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import './screens/landing_screen.dart';
import './screens/signup_screen.dart';
import './screens/tab_screen.dart';
import 'screens/postad.dart';
import './utils/custom_theme.dart';
import './models/item.dart';
import './routes/route.dart' as route;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      Locale('en', 'US'),
      Locale('am', 'ET'),
      Locale('en', 'ER')
    ],
    path: "assets/translations",
    saveLocale: true,
    fallbackLocale: Locale('en', 'US'),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Items(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final customTheme = CustomTheme(constraints);
          return MaterialApp(
              title: 'Desta Ecommerce app',
              theme: ThemeData(
                primarySwatch: Colors.green,
                textTheme: customTheme.nunito(),
                elevatedButtonTheme: customTheme.elevatedButtonTheme(),
                outlinedButtonTheme: customTheme.outlinedButtonTheme(),
                textButtonTheme: customTheme.textButtonTheme(),
                dividerTheme: customTheme.dividerTheme(),
              ),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              builder: EasyLoading.init(),
              // home: SpecialDealScreen(catagory: 'senior developer'),
              //home: HomeScreen(),
              // home: TabScreen()
              // home: DragonFruitScreen(id: "64551c2b8fde0cde141e2221"),
              //home: CheckoutScreen(),
              // home: LoginScreen(),
              //home: CategoryScreen()
              home: LandingScreen(),
              routes: route.Route().routes);
          // routes: route.Route().routes);
             
        },
      ),
    );
  }
}
