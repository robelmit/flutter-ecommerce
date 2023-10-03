import 'package:app/screens/checkpayment.dart';
import 'package:app/screens/addview.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/fav_deal_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../models/item.dart';
import '../utils/screen_utils.dart';
import '../widgets/indi_deal_card.dart';
import '../widgets/list_card.dart';
import '../widgets/tab_title.dart';
import 'package:chapasdk/chapasdk.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'dart:collection';

import '../widgets/user_deal_card.dart';

// import 'package:webview_flutter/webview_flutter.dart';

class AddofUser extends StatefulWidget {
  final String id;
  final String name;
  final String phone;

  AddofUser({required this.id, required this.name, required this.phone});

  @override
  State<AddofUser> createState() => _FavScreenState();
}

class _FavScreenState extends State<AddofUser> {
  var api = Api();
  String firsttime = '';

  @override
  void initState() {
    // TODO: implement initState
    // if (Platform.isAndroid) {
    //   WebView.platform = SurfaceAndroidWebView();
    // }
    var valuepro;

    // api.getsetting().then((value) => {
    //   // val
    // });

    // Navigator.push<void>(
    //   context,
    //   MaterialPageRoute<void>(
    //     builder: (BuildContext context) => const Checker(argument: {
    //       'message': 'message',
    //       'transactionReference': 'transactionReference',
    //       'paidAmount': 'amountPaid'
    //     }),
    //   ),
    // );

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

    // initalizing chapa payment sdk
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${'moreitemsby'.tr()} ${widget.name}'),
            Text(
              '${widget.phone}',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: api.getaddofuserid(widget.id),
          //future: api.getaddsbycatagory(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            print('calling');
            print(snapshot.data);
            if (snapshot.hasData) {
              if (snapshot.data!.length < 1) {
                return Center(
                    child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/noitem.svg',
                      height: 200,
                    ),
                    Text('noaddsyet'.tr()),
                  ],
                ));
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(children: [
                    Text('Error occured'.tr()),
                    Image.asset(
                      'assets/images/errorpage.png',
                      height: 200,
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              api.getaddofuserid(widget.id);
                            });
                          },
                          child: Text('Retry again'.tr())),
                    )
                  ]),
                );
              } else {
                return Container(
                  // height: MediaQuery.of(context).size.height - 200,
                  child: ListView.builder(
                      // physics: ScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      //scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return DealCardUser(
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
                            context: context,
                            id: snapshot.data![index].id!,
                            imageurl: snapshot.data![index].images!.first.url,
                            description: snapshot.data![index].description!,
                            price: snapshot.data![index].price!);
                      }),
                );
              }
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
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
