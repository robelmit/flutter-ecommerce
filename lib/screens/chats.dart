import 'package:app/screens/chatscreen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/screen_utils.dart';

class ChatScreenPro extends StatefulWidget {
  const ChatScreenPro({super.key});

  @override
  State<ChatScreenPro> createState() => _ChatScreenProState();
}

class _ChatScreenProState extends State<ChatScreenPro> {
  var api = Api();
  String firsttime = '';
  String userid = '';
  String? name;

  @override
  void initState() {
    // TODO: implement initState
    mountask();
    super.initState();
  }

  mountask() async {
    print('hi there ');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var isloggedin = prefs.getString('id');
    name = prefs.getString('name');
    print(isloggedin);
    if (isloggedin != null) {
      setState(() {
        firsttime = isloggedin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        Text('logintoviewyourchatsLogin'.tr(),
                            style: TextStyle(
                                color: Color.fromARGB(86, 8, 4, 19)
                                    .withOpacity(0.8))),
                        Image.asset('assets/images/d.png',
                            width: MediaQuery.of(context).size.width / 2),
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
        : SafeArea(
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      // IconButton(
                      //   icon: Icon(Icons.arrow_back_ios_new),
                      //   onPressed: (){},
                      // ),
                      Text(
                        'chatscreen'.tr(),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(17),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Icon(Icons.messenger_outline)]),
                      ),
                    ],
                  ),
                ),

                // ListView.builder(
                //     // physics: ScrollPhysics(),
                //     itemCount: robi.length,

                //     //scrollDirection: Axis.vertical,
                //     shrinkWrap: true,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         leading: CircleAvatar(
                //           radius: 25,
                //           backgroundColor: Colors.green,
                //           backgroundImage: AssetImage(robi[index]['imageurl']!),
                //         ),
                //         title: Text(robi[index]['title']!),
                //         subtitle: Text(robi[index]['message']!),
                //         trailing: Icon(Icons.bubble_chart_sharp),
                //       );
                //     })
                FutureBuilder(
                    future: api.getrooms(),
                    //future: api.getaddsbycatagory(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.length < 1) {
                          return Center(
                              child: Column(
                            children: [
                              Text('noroomsyet'.tr()),
                            ],
                          ));
                        } else {
                          return Container(
                            // height: MediaQuery.of(context).size.height - 200,
                            child: ListView.builder(
                                // physics: ScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                //scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // print(snapshot.data[index]);
                                      print('hey');
                                      String tosend = '';
                                      if (name ==
                                          snapshot.data[index]['userto']
                                              ['name']) {
                                        print('a');
                                        tosend = snapshot.data[index]
                                            ['userfrom']['name'];
                                        userid = snapshot.data[index]
                                            ['userfrom']['_id'];
                                      } else if (name ==
                                          snapshot.data[index]['userfrom']
                                              ['name']) {
                                        print('b');
                                        tosend = snapshot.data[index]['userto']
                                            ['name'];
                                        print(snapshot.data[index]['userto']);
                                        userid = snapshot.data[index]['userto']
                                            ['_id'];
                                      }

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ChatDetail(
                                                      id: snapshot.data[index]
                                                          ['roomid'],
                                                      usertoid: userid,
                                                      userto: tosend)));
                                    },
                                    child: ListTile(
                                      leading: const CircleAvatar(
                                        radius: 25,
                                        backgroundColor:
                                            Color.fromARGB(255, 82, 112, 83),
                                        backgroundImage: AssetImage(
                                            'assets/images/user.png'),
                                      ),
                                      title: name ==
                                              snapshot.data[index]['userto']
                                                  ['name']
                                          ? Text(snapshot.data[index]
                                                  ['userfrom']['name']
                                              .toString())
                                          : Text(snapshot.data[index]['userto']
                                                  ['name']
                                              .toString()),
                                      // subtitle: Text('nice'),
                                      trailing: Icon(Icons.bubble_chart_sharp),
                                    ),
                                  );
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
                      else if (snapshot.hasError) {
                        return Center(
                          child: Column(children: [
                            Text('an arror occured'.tr()),
                            Image.asset(
                              'assets/images/errorpage.png',
                              height: 200,
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    api.getrooms();
                                  });
                                },
                                child: Text('Retry again'.tr()))
                          ]),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    })
              ],
            ),
          );
  }
}
