
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';




import 'package:provider/provider.dart';
import './screens/landing_screen.dart';
import './screens/postad.dart';
import './utils/custom_theme.dart';
import './models/item.dart';
import './routes/route.dart' as route;
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
//DevicePreview(enabled: true,builder: (context) =>  
//                    useInheritedMediaQuery: true,

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('am', 'ET'),
        Locale('en', 'ER'),
        Locale('en', 'KE'),
      ],
      path: "assets/translations",
      saveLocale: true,
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
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
              //Nahom221
           
              home: LandingScreen(),
              // home: MyNewApp(),
              routes: route.Route().routes);
          // routes: route.Route().routes);
        },
      ),
    );
  }
}
