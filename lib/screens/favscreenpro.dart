// import 'package:app/screens/dragon_fruit_screen.dart';
// import 'package:app/screens/login_screen.dart';
// import 'package:app/screens/signup_screen.dart';
// import 'package:app/services/api.dart';
// import 'package:app/widgets/custom_app_bar.dart';
// import 'package:app/widgets/fav_deal_card.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import '../constants/colors.dart';
// import '../models/item.dart';
// import '../utils/screen_utils.dart';
// import '../widgets/indi_deal_card.dart';
// import '../widgets/list_card.dart';
// import '../widgets/tab_title.dart';
// // import 'package:webview_flutter/webview_flutter.dart';
// import 'dart:io';
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter_webview_pro/webview_flutter.dart';

// // import 'package:web_browser/web_browser.dart';

// import 'dart:collection';

// // import 'package:webview_flutter/webview_flutter.dart';

// var api = Api();

// class FavScreen extends StatefulWidget {
//   final Function setstateCallback;

//   FavScreen(this.setstateCallback);

//   @override
//   State<FavScreen> createState() => _FavScreenState();
// }

// class _FavScreenState extends State<FavScreen> {
//   String firsttime = '';

//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();
//   // double _progress = 0;

//   // late InAppWebViewController inAppWebViewController;

//   //  final _controller = WebViewController()
//   //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   //     ..setNavigationDelegate(
//   //       NavigationDelegate(
//   //         onProgress: (int progress) {
//   //           // print the loading progress to the console
//   //           // you can use this value to show a progress bar if you want
//   //           debugPrint("Loading: $progress%");
//   //         },
//   //         onPageStarted: (String url) {},
//   //         onPageFinished: (String url) {},
//   //         onWebResourceError: (WebResourceError error) {},
//   //         onNavigationRequest: (NavigationRequest request) {
//   //           return NavigationDecision.navigate;
//   //         },
//   //       ),
//   //     )
//   //     ..loadRequest(Uri.parse("https://www.kindacode.com"));
//   @override
//   void initState() {
//     // TODO: implement initState
//     if (Platform.isAndroid) {
//       WebView.platform = SurfaceAndroidWebView();
//     }

//     mountask();
//     super.initState();
//   }

//   mountask() async {
//     print('hi there ');
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     var isloggedin = prefs.getString('id');
//     print(isloggedin);
//     if (isloggedin != null) {
//       setState(() {
//         firsttime = isloggedin;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WebviewScaffold(
//         url:
//             'https://checkout.chapa.co/checkout/payment/AJM03Tpmq3Q19PTVle0Iril88NoN1bOY2XoQzbxBXBZX4',
//         appBar: new AppBar(
//           title: const Text('Widget webview'),
//         ),
//         withZoom: true,
//         withLocalStorage: true,
//         hidden: true,
//         initialChild: Container(
//           color: Colors.redAccent,
//           child: const Center(
//             child: Text('Waiting.....'),
//           ),
//         ));
//   }
// }
