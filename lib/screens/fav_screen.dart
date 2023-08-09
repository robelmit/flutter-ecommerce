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
// import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

import 'dart:collection';


// import 'package:webview_flutter/webview_flutter.dart';

var api = Api();
class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}
class FavScreen extends StatefulWidget {
  
  final Function setstateCallback;

   FavScreen(this.setstateCallback);

        final ChromeSafariBrowser browser = new MyChromeSafariBrowser();

  

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  String firsttime = '';
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
  // double _progress = 0;

  // late InAppWebViewController inAppWebViewController;

  //  final _controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setNavigationDelegate(
  //       NavigationDelegate(
  //         onProgress: (int progress) {
  //           // print the loading progress to the console
  //           // you can use this value to show a progress bar if you want
  //           debugPrint("Loading: $progress%");
  //         },
  //         onPageStarted: (String url) {},
  //         onPageFinished: (String url) {},
  //         onWebResourceError: (WebResourceError error) {},
  //         onNavigationRequest: (NavigationRequest request) {
  //           return NavigationDecision.navigate;
  //         },
  //       ),
  //     )
  //     ..loadRequest(Uri.parse("https://www.kindacode.com"));
  @override
  void initState() {
    // TODO: implement initState
    // if (Platform.isAndroid) {
    //   WebView.platform = SurfaceAndroidWebView();
    // }

    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
        }));
        
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
    widget.browser.open(
                  url: Uri.parse("https://checkout.chapa.co/checkout/payment/AJM03Tpmq3Q19PTVle0Iril88NoN1bOY2XoQzbxBXBZX4"),
                  options: ChromeSafariBrowserClassOptions(
                      android: AndroidChromeCustomTabsOptions(
                          shareState: CustomTabsShareState.SHARE_STATE_OFF,
                          showTitle: false,
                          enableUrlBarHiding: true
                          ),
                      ios: IOSSafariOptions(barCollapsingEnabled: true)));
  }

  @override
  Widget build(BuildContext context) {
    // return Text('This is cool');
    // return WebView(
    //   zoomEnabled: true,
    //   initialUrl:
    //       'https://checkout.chapa.co/checkout/payment/AJM03Tpmq3Q19PTVle0Iril88NoN1bOY2XoQzbxBXBZX4',
    //   javascriptMode: JavascriptMode.unrestricted,
    //   onWebViewCreated: (WebViewController webViewController) {
    //     _controller.complete(webViewController);
    //   },
    //   onProgress: (int progress) {
    //     print("WebView is loading (progress : $progress%)");
    //   },
    //   javascriptChannels: <JavascriptChannel>{
    //     // _toasterJavascriptChannel(context),
    //   },
    //   navigationDelegate: (NavigationRequest request) {
    //     if (request.url.startsWith('https://www.youtube.com/')) {
    //       print('blocking navigation to $request}');
    //       return NavigationDecision.prevent;
    //     }
    //     print('allowing navigation to $request');
    //     return NavigationDecision.navigate;
    //   },
    //   onPageStarted: (String url) {
    //     print('Page started loading: $url');
    //   },
    //   onPageFinished: (String url) {
    //     print('Page finished loading: $url');
    //   },
    //   gestureNavigationEnabled: true,
    //   geolocationEnabled: false, //support geolocation or not
    // );
    // return Stack(
    //   children: [
    //     InAppWebView(
    //       initialOptions: InAppWebViewGroupOptions(
    //   android: AndroidInAppWebViewOptions(
    //     useHybridComposition: true,
    //     displayZoomControls: true
    //   ),),

    //       initialUrlRequest:
    //           URLRequest(url: Uri.parse("https://checkout.chapa.co/checkout/payment/AJM03Tpmq3Q19PTVle0Iril88NoN1bOY2XoQzbxBXBZX4")),
    //       onWebViewCreated: (InAppWebViewController controller) {
    //         inAppWebViewController = controller;
    //       },
    //       onProgressChanged: (InAppWebViewController controller, int progress) {
    //         setState(() {
    //           _progress = progress / 100;
    //         });
    //       },
    //     ),
    //     _progress < 1
    //         ? Container(
    //             child: LinearProgressIndicator(
    //               value: _progress,
    //             ),
    //           )
    //         : SizedBox()
    //   ],
    // );

    // return WebView(
    //   initialUrl:
    //       'https://checkout.chapa.co/checkout/payment/AJM03Tpmq3Q19PTVle0Iril88NoN1bOY2XoQzbxBXBZX4',
    //   javascriptMode: JavascriptMode.unrestricted,
    //   onWebViewCreated: (WebViewController webViewController) {
    //     _controller.complete(webViewController);
    //   },
    //   onProgress: (int progress) {
    //     print("WebView is loading (progress : $progress%)");
    //   },
    //   javascriptChannels: <JavascriptChannel>{
    //     // _toasterJavascriptChannel(context),
    //   },
    //   navigationDelegate: (NavigationRequest request) {
    //     if (request.url.startsWith('https://www.youtube.com/')) {
    //       print('blocking navigation to $request}');
    //       return NavigationDecision.prevent;
    //     }
    //     print('allowing navigation to $request');
    //     return NavigationDecision.navigate;
    //   },
    //   onPageStarted: (String url) {
    //     print('Page started loading: $url');
    //   },
    //   onPageFinished: (String url) {
    //     print('Page finished loading: $url');
    //   },
    //   gestureNavigationEnabled: true,
    // );

    return (firsttime.isEmpty)
        ? Container(
            child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    height: (MediaQuery.of(context).size.height) / 2,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    color: Color.fromARGB(15, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('logintoviewyourfavoutite'.tr(),
                            style: TextStyle(
                                color: Color.fromARGB(86, 8, 4, 19)
                                    .withOpacity(0.8))),
                        SizedBox(height: 0),
                        Image.asset('assets/images/d.png',
                            width: MediaQuery.of(context).size.width / 2),
                        SizedBox(height: 20),
                        Column(
                          children: [
                            FilledButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(
                                      context, SignupScreen.routeName);
                                },
                                child: Text(
                                  'signup'.tr(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                )),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('alreadyhaveaccount'.tr(),
                                      style: TextStyle(fontSize: 12.0)),
                                  TextButton(
                                      child: Text('login'.tr(),
                                          style: TextStyle(fontSize: 12.0)),
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, LoginScreen.routeName);
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
                if (snapshot.data!.length < 1) {
                  return Center(
                      child: Column(
                    children: [
                      Image.asset(
                        "assets/images/empty_cart_illu.png",
                        height: 200,
                      ),
                      Text('nofavouritesyet'.tr()),
                    ],
                  ));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(children: [
                      Text('Error occured'),
                      Image.asset(
                        'assets/images/errorpage.png',
                        height: 200,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              api.getfavourites();
                            });
                          },
                          child: Text('Retry again'))
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
                          return DealCardfav(
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
            });
  }
}
