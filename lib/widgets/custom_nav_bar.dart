import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomNavBar extends StatefulWidget {
  final int curTabIndex;
  final Function(int) onTap;
  CustomNavBar(this.onTap, this.curTabIndex);
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (tabIndex) {
        widget.onTap(tabIndex);
      },
      selectedItemColor: kPrimaryGreen,
      unselectedItemColor: kGreyShade2,
      currentIndex: widget.curTabIndex,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: widget.curTabIndex == 0
              ? Image.asset(
                  'assets/images/home_nav.png',
                )
              : Image.asset(
                  'assets/images/home_nav_notfill.png',
                ),
          label: 'home'.tr(),
        ),
        BottomNavigationBarItem(
          icon: widget.curTabIndex == 1
              ? Image.asset(
                  'assets/images/star_nav_fill.png',
                )
              : Image.asset(
                  'assets/images/star_nav.png',
                ),
          label: 'favourite'.tr(),
        ),
        BottomNavigationBarItem(
          icon: widget.curTabIndex == 2
              ? Icon(
                  Icons.message_rounded,
                  color: Theme.of(context).primaryColor,
                )
              : Icon(
                  Icons.message_rounded,
                  color: const Color.fromARGB(92, 158, 158, 158),
                ),
          label: 'chats'.tr(),
        ),
        BottomNavigationBarItem(
          icon: widget.curTabIndex == 3
              ? Image.asset(
                  'assets/images/profile_nav_fill.png',
                )
              : Image.asset(
                  'assets/images/user_nav.png',
                ),
          label: 'profile'.tr(),
        ),
      ],
    );
  }
}
