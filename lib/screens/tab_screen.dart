import 'package:app/screens/chats.dart';
import 'package:app/screens/chatscreen.dart';
import 'package:app/screens/map_screen.dart';
import 'package:app/services/api.dart';
import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';
import '../screens/fav_screen.dart';
import '../screens/home_screen.dart';
import '../screens/home_screen1.dart';
import '../screens/user_screen.dart';
import '../widgets/custom_nav_bar.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tabScreen';
  String? tab;
  @override
  TabScreen({this.tab});
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int curTab = 0;
  @override
  void initState() {
    if (widget.tab != null) {
      print('Tab' + widget.tab!);
      curTab = int.parse(widget.tab!);
      setState(() {});
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

//  {
//         'widget': HomeScreen1(),
//       },

  @override
  Widget build(BuildContext context) {
    List<Map<String, Widget>> pages = [
  {
        'widget': HomeScreen1(),
      },
      {
        'widget': FavScreen(() {
          setState(() {
            curTab = 0;
          });
        }),
      },
      {
        'widget': ChatScreenPro(),
      },
      {
        'widget': UserScreen(),
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: pages[curTab]['widget']!,
      ),
      bottomNavigationBar: CustomNavBar((index) {
        setState(() {
          curTab = index;
        });
      }, curTab),
    );
  }
}
