import 'dart:convert';

import 'package:app/screens/chats.dart';
import 'package:app/screens/chatscreen.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:app/services/api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';
import '../models/image.dart';
import '../screens/order_summary_screen.dart';
import '../utils/screen_utils.dart';
import '../widgets/GalleryPhotoWrapper.dart';
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
import 'package:app/screens/addview.dart';
import 'package:photo_view/photo_view.dart';

import 'adds_of_user.dart';

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
                  print('this is cool');
                  // print(images);
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    var images = snapshot.data!['images'];
                    return Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: images!.length,
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            height: 300,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
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
                                  child: Hero(
                                    tag: '${images[i]['_id']} $i',
                                    child: PhotoView(
                                      imageProvider: NetworkImage(
                                        images[i]['url'],
                                        // width: 500,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                List totalimages = images.toList();
                                // print(totalimages[0].url);
                                // print(totalimages[0].url);
                                // print('totalimages[0][url]');
                                // print(totalimages[0]['url']);

                                //                               var map1 = {};
                                // url.forEach((Student) => map1[Student.] = Student.name);
                                //                               Map<String, dynamic> userMap = url;
                                //                               var galleries = ImageModel.fromJson(userMap);
                                List<ImageModel> galleries = [];
                                //   ImageModel(id: 1, resource: "assets/mountain.jpg", description: "Image Mountain Default", isSVG: false),
                                //   ImageModel(id: 2, resource: "assets/mountain1.jpg", description: "Image Mountain 1", isSVG: false),
                                //   ImageModel(id: 3, resource: "assets/mountain2.jpg", description: "Image Mountain 2", isSVG: false),
                                // ];

                                for (int j = 0; j < totalimages.length; j++) {
                                  print(totalimages[j]['url']);
                                  galleries.add(ImageModel(
                                      url: totalimages[j]['url'],
                                      isprimary: totalimages[j]['isprimary'],
                                      id: totalimages[j]['_id']));
                                }
                                //[{url: http://192.168.43.34:5000/image_1694686484516.jpg, isprimary: true, _id: 6502dd150f117e868f23d5f5}, {url: http://192.168.43.34:5000/image_1694686484552.jpg, isprimary: false, _id: 6502dd150f117e868f23d5f6}]
                                print('galleries');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GalleryPhotoWrapper(
                                              galleries: galleries,
                                              backgroundDecoration:
                                                  const BoxDecoration(
                                                      color: Colors.black),
                                              initalIndex: i,
                                              scrollDirection: Axis.horizontal,
                                            )));
                                print('ckck');
                                // print(url);
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
                              'Posted by'.tr(),
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => AddofUser(
                                          id: snapshot.data!["postedBy"]['_id'],
                                          name: snapshot.data!["postedBy"]
                                              ['name'],
                                          phone: snapshot.data!["postedBy"]
                                              ['phoneNumber'],
                                        ))));
                          },
                          child: Align(
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
                                      backgroundImage: AssetImage(
                                          'assets/images/person5.jpg'),
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
                                      onPressed: () async {
                                        print('we are on the line ' +
                                            snapshot.data!["postedBy"]['_id']
                                                .toString());
                                        if (userid != null) {
                                          await api.createroom(
                                              userid,
                                              snapshot.data!["postedBy"]["_id"]
                                                  .toString());
                                          Fluttertoast.showToast(
                                              msg: "roomcreatedsuccessfully"
                                                  .tr(),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.SNACKBAR,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          Future.delayed(Duration(seconds: 2))
                                              .then((value) {
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
                                          });
                                        }
                                      },
                                      child: Text(
                                        'messageuser'.tr(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            overflow: TextOverflow.ellipsis),
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
                                            fontWeight: FontWeight.normal,
                                            overflow: TextOverflow.ellipsis),
                                      ))
                                ])),
                        Builder(builder: (context) {
                          if (snapshot.data!["catagory"] == "cars") {
                            return Container(
                                margin: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color:
                                          Color.fromARGB(117, 110, 110, 110)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(children: [
                                    SizedBox(height: 5),
                                    Text('More details'.tr()),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Column(children: [
                                        Text('category'.tr()),
                                        SizedBox(height: 3),
                                        Text(
                                            "${snapshot.data['detailcatagory']}",
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ]),
                                      Spacer(),
                                      Column(children: [
                                        Text('Model'.tr()),
                                        SizedBox(height: 3),
                                        Text("${snapshot.data['model']}".tr(),
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ]),
                                    ]),
                                    Row(children: [
                                      Column(children: [
                                        Text('transmission'.tr()),
                                        SizedBox(height: 3),
                                        Text(
                                            "${snapshot.data['transmission']}"
                                                .tr(),
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ]),
                                      Spacer(),
                                      Column(children: [
                                        Text('engineSize'.tr()),
                                        SizedBox(height: 3),
                                        Text(
                                            "${snapshot.data['engineSize']}"
                                                .tr(),
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ]),
                                    ]),
                                    SizedBox(height: 4),
                                    Row(children: [
                                      Column(children: [
                                        Text('Fuel'.tr()),
                                        SizedBox(height: 3),
                                        Text("${snapshot.data['fuel']}".tr(),
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ]),
                                      Spacer(),
                                      Column(children: [
                                        Text('Mile Age'.tr()),
                                        SizedBox(height: 3),
                                        Text("${snapshot.data['mileAge']}".tr(),
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ]),
                                    ]),
                                    Row(children: [
                                      Column(children: [
                                        Text('color'.tr()),
                                        SizedBox(height: 3),
                                        Text("${snapshot.data['color']}".tr(),
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ]),
                                      Spacer(),
                                      Column(children: [
                                        Text('Manifacturing year'.tr()),
                                        SizedBox(height: 3),
                                        Text("${snapshot.data['year']}".tr(),
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ]),
                                    ]),
                                  ]),
                                ));
                          }
                          return Container();
                        }),
                      ],
                    );
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
                                  api.getaddsbyid(widget.id);
                                });
                              },
                              child: Text('Retry again'.tr())),
                        )
                      ]),
                    );
                  } else
                    return CircularProgressIndicator();
                })
          ]),
    )));
  }
}
