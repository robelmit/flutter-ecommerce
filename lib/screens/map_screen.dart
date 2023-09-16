import 'package:app/screens/postad.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:app/screens/user_screen.dart';
import 'package:app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/back_button_ls.dart';
import '../widgets/custom_text_field.dart';
import 'package:location/location.dart';
// import 'package:geolocator/geolocator.dart';

class MapScreen extends StatelessWidget {
  static const routeName = '/map_screen';

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, TabScreen.routeName);
                  },
                ),
                Text(
                  'Choose Your Address',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(17),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(32),
                )
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/map_pattern.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/curLoc.png',
                    ),
                  ),
                  BottomCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomCard extends StatefulWidget {
  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  var api = new Api();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: SizedBox(
                width: getProportionateScreenWidth(56),
                height: getProportionateScreenWidth(56),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.gps_fixed,
                    size: getProportionateScreenWidth(32),
                  ),
                  backgroundColor: kPrimaryGreen,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getProportionateScreenWidth(
                      8,
                    ),
                  ),
                  topRight: Radius.circular(
                    getProportionateScreenWidth(
                      8,
                    ),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [],
                    ),

                    // ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          _initLocationService().then((value) => {
                                prefs.setString(
                                    'latitude', value.latitude.toString()),
                                prefs.setString(
                                    'longitude', value.longitude.toString()),
                                    prefs.setString(
                                    'islocationsaved', 'true'),
                                api.savelocation(
                                    value.latitude, value.longitude),
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            UserScreen()))
                              }); //
                        },
                        child: Text('Enable location'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _initLocationService() async {
  var location = Location();

  if (!await location.serviceEnabled()) {
    if (!await location.requestService()) {
      return;
    }
  }

  var permission = await location.hasPermission();
  if (permission == PermissionStatus.denied) {
    permission = await location.requestPermission();
    if (permission != PermissionStatus.granted) {
      return;
    }
  }

  var loc = await location.getLocation();
  print("${loc.latitude} ${loc.longitude}");
  return loc;
}
