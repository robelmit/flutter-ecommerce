import 'package:app/screens/check.dart';
import 'package:app/screens/dragon_fruit_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/fav_deal_card.dart';
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
import 'package:chapasdk/chapasdk.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'dart:collection';

// import 'package:webview_flutter/webview_flutter.dart';

var api = Api();

class FavScreen extends StatefulWidget {
  final Function setstateCallback;

  FavScreen(this.setstateCallback);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  var api = Api();
  InAppWebViewController? webView;
  String url = "";
  double progress = 0;
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
        displayZoomControls: false,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

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
        // firsttime = isloggedin;
      });
    }

    // initalizing chapa payment sdk


    Chapa.paymentParameters(
        context: context, // context 
        publicKey: 'CHASECK_TEST-Mkp2ETiF5AgbdcHYOubHdihacubwUlhP',
        currency: 'ETB',
        amount: '200',
        email: 'xyz@gmail.com',
        firstName: 'fullName',
        lastName: 'lastName',
        txRef: '34TXc15bdsf459058c012320567293234200wefsdf0017826ui091010233789',
        title: 'title',
        desc:'desc',
        namedRouteFallBack: '/checker', // fall back route name
       );
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InAppWebView Example'),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
                "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse(
                        "https://checkout.chapa.co/checkout/payment/nZ26C2bzjf0l8ZuyXzpmigG0Uf5DRb0qy9we38Qa2eQ1X")),
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(),
                    ios: IOSInAppWebViewOptions(),
                    android:
                        AndroidInAppWebViewOptions(useHybridComposition: true)),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (controller, url) {
                  setState(() {
                    this.url = url?.toString() ?? '';
                  });
                },
                onLoadStop: (controller, url) async {
                  setState(() {
                    this.url = url?.toString() ?? '';
                  });
                },
                onProgressChanged: (controller, progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  webView?.goBack();
                },
              ),
              ElevatedButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  webView?.goForward();
                },
              ),
              ElevatedButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  webView?.reload();
                },
              ),
            ],
          ),
        ])),
      ),
    );

    // return (firsttime.isEmpty)
    //     ? Container(
    //         child: Center(
    //             child: Container(
    //                 width: MediaQuery.of(context).size.width * 2 / 3,
    //                 height: (MediaQuery.of(context).size.height) / 2,
    //                 padding: EdgeInsets.symmetric(horizontal: 30.0),
    //                 color: Color.fromARGB(15, 0, 0, 0),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Text('logintoviewyourfavoutite'.tr(),
    //                         style: TextStyle(
    //                             color: Color.fromARGB(86, 8, 4, 19)
    //                                 .withOpacity(0.8))),
    //                     SizedBox(height: 0),
    //                     Image.asset('assets/images/d.png',
    //                         width: MediaQuery.of(context).size.width / 2),
    //                     SizedBox(height: 20),
    //                     Column(
    //                       children: [
    //                         FilledButton(
    //                             onPressed: () {
    //                               Navigator.popAndPushNamed(
    //                                   context, SignupScreen.routeName);
    //                             },
    //                             child: Text(
    //                               'signup'.tr(),
    //                               style:
    //                                   TextStyle(fontWeight: FontWeight.normal),
    //                             )),
    //                         Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: [
    //                               Text('alreadyhaveaccount'.tr(),
    //                                   style: TextStyle(fontSize: 12.0)),
    //                               TextButton(
    //                                   child: Text('login'.tr(),
    //                                       style: TextStyle(fontSize: 12.0)),
    //                                   onPressed: () {
    //                                     Navigator.popAndPushNamed(
    //                                         context, LoginScreen.routeName);
    //                                   })
    //                             ])
    //                       ],
    //                     ),
    //                   ],
    //                 ))),
    //       )
    //     : FutureBuilder(
    //         future: api.getfavourites(),
    //         //future: api.getaddsbycatagory(),
    //         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //           if (snapshot.hasData) {
    //             if (snapshot.data!.length < 1) {
    //               return Center(
    //                   child: Column(
    //                 children: [
    //                   Image.asset(
    //                     "assets/images/empty_cart_illu.png",
    //                     height: 200,
    //                   ),
    //                   Text('nofavouritesyet'.tr()),
    //                 ],
    //               ));
    //             } else if (snapshot.hasError) {
    //               return Center(
    //                 child: Column(children: [
    //                   Text('Error occured'),
    //                   Image.asset(
    //                     'assets/images/errorpage.png',
    //                     height: 200,
    //                   ),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         setState(() {
    //                           api.getfavourites();
    //                         });
    //                       },
    //                       child: Text('Retry again'))
    //                 ]),
    //               );
    //             } else {
    //               return Container(
    //                 // height: MediaQuery.of(context).size.height - 200,
    //                 child: ListView.builder(
    //                     // physics: ScrollPhysics(),
    //                     itemCount: snapshot.data!.length,
    //                     //scrollDirection: Axis.vertical,
    //                     shrinkWrap: true,
    //                     itemBuilder: (context, index) {
    //                       return DealCardfav(
    //                           onTap: () {
    //                             // home: DragonFruitScreen(id: "64551c2b8fde0cde141e2221"),

    //                             Navigator.of(context).push(MaterialPageRoute(
    //                                 //snapshot.data![index]._id
    //                                 builder: (BuildContext context) =>
    //                                     DragonFruitScreen(
    //                                         id: snapshot.data![index].id)));
    //                           },
    //                           isHorizontalScrolling: false,
    //                           //

    //                           title: snapshot.data![index].title!,
    //                           context: context,
    //                           id: snapshot.data![index].id!,
    //                           imageurl: snapshot.data![index].images!.first.url,
    //                           description: snapshot.data![index].description!,
    //                           price: snapshot.data![index].price!);
    //                     }),
    //               );
    //             }
    //           }

    //           // child: Column(
    //           //   // padding: EdgeInsets.symmetric(
    //           //   //   horizontal: getProportionateScreenWidth(16.0),

    //           //   children: [
    //           //     DealCard(
    //           //       onTap: () {
    //           //         // Navigator.of(context)
    //           //         //     .pushNamed(SpecialDealChildScreen.routeName);
    //           //       },
    //           //       isHorizontalScrolling: false,
    //           //       title: 'Full stack Developer',
    //           //       description:
    //           //           'Robel is Experienced Fullstack Web Developer',
    //           //       price: '2000000\$',
    //           //     ),
    //           //   ],
    //           // ),

    //           else {
    //             return Center(child: CircularProgressIndicator());
    //           }
    //         });
  }
}
