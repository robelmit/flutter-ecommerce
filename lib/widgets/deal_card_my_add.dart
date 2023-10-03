import 'package:app/screens/myadds.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants/colors.dart';
import '../screens/postupdate.dart';
import '../services/api.dart';
import '../utils/screen_utils.dart';
import 'package:easy_localization/easy_localization.dart';

class MyAddDealCard extends StatelessWidget {
  final bool isHorizontalScrolling;
  final void Function()? onTap;
  final String? title;
  final String? description;
  final String? price;
  final String id;
  // final bool isLive;
  final BuildContext context;
  final String? imageurl;

  //final Function onTap;
//this.onTap,
  const MyAddDealCard(
      {this.isHorizontalScrolling = true,
      this.onTap,
      required this.title,
      required this.id,
      required this.context,
      required this.description,
      required this.price,
      required this.imageurl,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Stack(children: [
          Container(
            //height:300,
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width,
            height: getProportionateScreenHeight(210),
            margin: EdgeInsets.only(
              left: isHorizontalScrolling
                  ? getProportionateScreenWidth(16)
                  : getProportionateScreenWidth(0),
              bottom: !isHorizontalScrolling
                  ? getProportionateScreenHeight(32)
                  : getProportionateScreenHeight(0),
            ),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(
                      8,
                    ),
                  ),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    kGradientColor,
                    kGradientColor.withOpacity(0),
                  ],
                ),
                image: DecorationImage(
                    image: NetworkImage(imageurl!), fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(8),
              ),
            ),
          ),
          // Positioned(
          //     top: 10,
          //     right: 10,
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.all(Radius.circular(5)),
          //       child: isLive == true
          //           ? Container(
          //               padding: EdgeInsets.all(5),
          //               color: Theme.of(context).primaryColor,
          //               child: Text('live'.tr()),
          //             )
          //           : Container(
          //               padding: EdgeInsets.all(5),
          //               color: Colors.redAccent,
          //               child: Text('pending'.tr()),
          //             ),
          //     )),
          Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 10.0),
              color: Colors.black.withOpacity(0.2),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w300,
                            shadows: const [
                              Shadow(color: Colors.black),
                              Shadow(color: Color.fromARGB(255, 154, 110, 68)),
                            ]),
                      ),
                      Text(
                        '$price birr',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton.outlined(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => PostUpdate(
                                id: id,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          LineAwesomeIcons.edit,
                          color: Colors.blue,
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton.outlined(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.warning,
                            title: 'Are you sure to delete add'.tr(),
                            // desc:
                            //     'Deleting an account will remove all your data from  ezana '
                            //         .tr(),
                            btnOkText: 'ok'.tr(),
                            btnCancelText: 'cancel'.tr(),
                            btnOkOnPress: () async {
                              removeadd(id, context);
                            },
                            btnCancelOnPress: () {
                              // Navigator.pushReplacementNamed(context, TabScreen.routeName);
                            },
                          ).show();
                        },
                        icon: const Icon(
                          LineAwesomeIcons.trash,
                          color: Colors.red,
                        )),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

removeadd(identity, context) {
  var api = Api();
  api.deleteaddofuser(identity).then((value) => {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => MyAdds()),
            ModalRoute.withName("/"))
      });
  // Navigator.
}
