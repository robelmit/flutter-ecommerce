
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import './screens/landing_screen.dart';
import './screens/postad.dart';
import './utils/custom_theme.dart';
import './models/item.dart';
import './routes/route.dart' as route;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:io';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('am', 'ET'),
      Locale('en', 'ER')
    ],
    path: "assets/translations",
    saveLocale: true,
    fallbackLocale: Locale('en', 'US'),
    child: MyApp(),
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
              debugShowCheckedModeBanner: false,
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
