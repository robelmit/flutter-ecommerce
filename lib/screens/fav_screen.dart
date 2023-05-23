import 'package:app/screens/dragon_fruit_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/deal_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../models/item.dart';
import '../utils/screen_utils.dart';
import '../widgets/indi_deal_card.dart';
import '../widgets/list_card.dart';
import '../widgets/tab_title.dart';

var api = Api();

class FavScreen extends StatefulWidget {
  final Function setstateCallback;

  const FavScreen(this.setstateCallback);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  String firsttime = '';
  @override
  void initState() {
    // TODO: implement initState
    mountask();
    super.initState();
  }

  mountask() async {
    print('hi there ');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var isloggedin = prefs.getString('id');
    print(isloggedin);
    if (isloggedin != null) {
      setState(() {
        firsttime = isloggedin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (firsttime.isEmpty)
        ? Container(
            child: Center(
                child: Container(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/d.png',
                    width: MediaQuery.of(context).size.width / 2),
                Text('logintoviewyourfavoutite'.tr(),
                    style: TextStyle(color: Colors.red.withOpacity(0.8))),
                Column(
                  children: [
                    FilledButton(
                        onPressed: () {
                            Navigator.popAndPushNamed(context, SignupScreen.routeName);

                        },
                        child: Text(
                          'signup'.tr(),
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('alreadyhaveaccount'.tr(),style:TextStyle(fontSize: 12.0)),
                      TextButton(child: Text('login'.tr(),style:TextStyle(fontSize: 12.0)), onPressed: () {
                            Navigator.popAndPushNamed(context, LoginScreen.routeName);

                      })
                    ])
                  ],
                ),
              ],
            ))),
          )
        : FutureBuilder(
            future: api.getfavourites(),
            //future: api.getaddsbycatagory(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.length < 1)
                  return Center(
                      child: Column(
                    children: [
                      Image.asset("assets/images/empty_cart_illu.png"),
                      Text('nofavouritesyet'.tr()),
                    ],
                  ));
                else
                  return Container(
                    // height: MediaQuery.of(context).size.height - 200,
                    child: ListView.builder(
                        // physics: ScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        //scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DealCard(
                              onTap: () {
                                // home: DragonFruitScreen(id: "64551c2b8fde0cde141e2221"),

                                Navigator.of(context).push(MaterialPageRoute(
                                    //snapshot.data![index]._id
                                    builder: (BuildContext context) =>
                                        DragonFruitScreen(
                                            id: snapshot.data![index].id)));
                              },
                              isHorizontalScrolling: false,
                              //

                              title: snapshot.data![index].title!,
                              imageurl: snapshot.data![index].images!.first.url,
                              description: snapshot.data![index].description!,
                              price: snapshot.data![index].price!);
                        }),
                  );
              }

              // child: Column(
              //   // padding: EdgeInsets.symmetric(
              //   //   horizontal: getProportionateScreenWidth(16.0),

              //   children: [
              //     DealCard(
              //       onTap: () {
              //         // Navigator.of(context)
              //         //     .pushNamed(SpecialDealChildScreen.routeName);
              //       },
              //       isHorizontalScrolling: false,
              //       title: 'Full stack Developer',
              //       description:
              //           'Robel is Experienced Fullstack Web Developer',
              //       price: '2000000\$',
              //     ),
              //   ],
              // ),

              else {
                return CircularProgressIndicator();
              }
            });
  }
}
