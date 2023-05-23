import 'package:app/screens/chats.dart';
import 'package:app/screens/chatscreen.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:app/services/api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';
import '../screens/order_summary_screen.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_input_button.dart';
import '../widgets/discount_text.dart';
import '../widgets/fruit_title.dart';
import '../widgets/image_placeholder.dart';
import '../widgets/indi_deal_card.dart';
import '../widgets/price_tag.dart';
import '../widgets/quantity_input.dart';
import '../widgets/tab_title.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app/screens/dragon_fruit_screen.dart';
import 'package:photo_view/photo_view.dart';

class DragonFruitScreen extends StatefulWidget {
  static const routeName = '/dragonFruit';
  String id;
  DragonFruitScreen({required this.id});
  @override
  _DragonFruitScreenState createState() => _DragonFruitScreenState();
}

class _DragonFruitScreenState extends State<DragonFruitScreen> {
  final textController = TextEditingController(text: '1');
  bool isReviewTab = false;
  var api = Api();
  var userid;
  @override
  void initState() {
    mountask();

    super.initState();
  }

  mountask() async {
    print('hi there ');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('id');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              'adddetails'.tr(),
              [
                SizedBox(
                  width: getProportionateScreenWidth(16),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(16),
                ),
              ],
              () {
                Navigator.of(context, rootNavigator: true).pop(context);
              },
            ),
            FutureBuilder(
                future: api.getaddsbyid(widget.id),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  var images = snapshot.data['images'];
                  print('this is cool');
                  print(images);
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: images.length,
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            height: 300,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 2),
                            reverse: false,
                            aspectRatio: 5.0,
                          ),
                          itemBuilder: (context, i, id) {
                            //for onTap to redirect to another screen
                            return GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                //ClipRRect for image border radius
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: PhotoView(
                                    imageProvider: NetworkImage(
                                      images[i]['url'],
                                      // width: 500,
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                var url = images[i];
                                print(url.toString());
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              Text(snapshot.data!['title'],
                                  style: TextStyle(fontSize: 20)),
                              SizedBox(height: 10),
                              Spacer(),
                              Text(
                                '${snapshot.data!["price"]} birr',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              snapshot.data!['description'],
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              'Posted by',
                              style: TextStyle(
                                color: Colors.grey[800],
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(5),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage('assets/images/person5.jpg'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${snapshot.data!["postedBy"]['name']}',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        Text(
                                            '${snapshot.data!["postedBy"]['phoneNumber']}')
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //  Spacer(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FilledButton(
                                      onPressed: () {
                                        print('we are on the line ' +
                                            snapshot.data!["postedBy"]['_id']
                                                .toString());
                                        if (userid != null) {
                                          api.createroom(
                                              userid,
                                              snapshot.data!["postedBy"]["_id"]
                                                  .toString());
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          TabScreen(
                                                            tab: "2",
                                                          )),
                                                  ModalRoute.withName(
                                                      "/tab_screen"));
                                        }
                                      },
                                      child: Text(
                                        'messageuser'.tr(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      )),
                                  SizedBox(width: 10),
                                  FilledButton(
                                      onPressed: () {
                                        var phone = 'tel://' +
                                            snapshot.data!["postedBy"]
                                                ['phoneNumber'];
                                        launch(phone);
                                      },
                                      child: Text(
                                        'calluser'.tr(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ))
                                ])),
                      ],
                    );
                  } else
                    return CircularProgressIndicator();
                })
          ]),
    )));
  }
}
