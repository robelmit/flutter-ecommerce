import 'package:app/screens/category_screen.dart';
import 'package:app/screens/checker.dart';
import 'package:app/services/api.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../screens/special_deal_child_screen.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/deal_card.dart';
import 'package:app/screens/dragon_fruit_screen.dart';

import '../widgets/fav_deal_card.dart';

var api = new Api();

class SpecialDealScreen extends StatefulWidget {
  static const routeName = '/special_deal';
  String catagory;
  String catagory1;
  SpecialDealScreen(
      {Key? key, required this.catagory, required this.catagory1});
  @override
  State<SpecialDealScreen> createState() => _SpecialDealScreenState();
}

class _SpecialDealScreenState extends State<SpecialDealScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              '${widget.catagory1}',
              [
                Icon(
                  Icons.category_sharp,
                  color: kPrimaryGreen,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(2),
                ),
              ],
              () {
                Navigator.of(context).pop();
              },
            ),
            // SizedBox(
            //   height: getProportionateScreenHeight(32),
            // ),
            Expanded(
              child: FutureBuilder(
                  future: api.getaddsbycatagory(widget.catagory),
                  //future: api.getaddsbycatagory(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data!.length);
                      if (snapshot.data!.length < 1) {
                        //  print('hey')
                        return Column(
                          children: [
                            Icon(
                              Icons.nearby_error_sharp,
                              color: Colors.green,
                              size: 50,
                            ),
                            Container(
                              width: 200,
                              //  color: Colors.red,
                              child: Center(
                                  child: Text('No ${widget.catagory}  Found')),
                            )
                          ],
                        );
                      } else
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
                                  imageurl:
                                      snapshot.data![index].images!.first.url,
                                  description: snapshot.data![index].description!,
                                  price: snapshot.data![index].price!,
                                );
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
            
                    else if (snapshot.hasError) {
                      return Center(
                        child: Column(children: [
                          Text('Error occured'),
                          Image.asset(
                            'assets/images/errorpage.png',
                            height: 200,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  api.getaddsbycatagory(widget.catagory);
                                });
                              },
                              child: Text('Retry again'))
                        ]),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
