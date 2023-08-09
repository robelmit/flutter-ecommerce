import 'package:app/screens/checker.dart';
import 'package:app/services/api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IndiDealCard extends StatefulWidget {
  final bool? isLeft;
  final bool isSelected;
  final bool noPadding;
  final String title;
  final String id;
  final String price;
  final String catagory;
  final String imageurl;
  final Function? addHandler;

  const IndiDealCard(
      {this.isLeft,
      required this.isSelected,
      //required this.isSelected,
      this.addHandler,
      required this.title,
      required this.price,
      required this.catagory,
      required this.imageurl,
      required this.id,
      this.noPadding = false});

  @override
  State<IndiDealCard> createState() => _IndiDealCardState();
}

class _IndiDealCardState extends State<IndiDealCard> {
  var api = Api();
  String? firsttime;
  @override
  void initState() {
    // TODO: implement initState
    mountask();
    super.initState();
  }

  mountask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isloggedin = prefs.getString('token');
    print(isloggedin);
    if (isloggedin != null) {
      setState(() {
        firsttime = isloggedin;
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !widget.noPadding
          ? EdgeInsets.only(
              left: widget.isLeft! ? getProportionateScreenWidth(16.0) : 0,
              right: widget.isLeft! ? 0 : getProportionateScreenWidth(16.0),
            )
          : EdgeInsets.all(0),
      child: Container(
        // width: 60.0,
        // height: 60.0,
        padding: EdgeInsets.all(
          getProportionateScreenWidth(8.0),
        ),
        margin: EdgeInsets.all(
          getProportionateScreenWidth(4.0),
        ),
        decoration: BoxDecoration(
          color:
              widget.isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(
              8,
            ),
          ),
          boxShadow: [
            widget.isSelected
                ? BoxShadow(
                    color: kShadowColor,
                    offset: Offset(
                      getProportionateScreenWidth(24),
                      getProportionateScreenWidth(40),
                    ),
                    blurRadius: 80,
                  )
                : BoxShadow(color: Colors.transparent),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kGreyShade5,
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(8.0),
                  ),
                ),
                child: Image.network(
                  '${widget.imageurl}',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.title}',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        //fontWeight: FontWeight.w700,
                        ),
                  ),
                  Spacer(),
                  Text(
                    '${widget.catagory}'.tr(),
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\$${widget.price}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          if (firsttime != null) {
                            api.addtofavourites(widget.id).then((value) => {
                                  setState(
                                    () {},
                                  )
                                });
                          } else
                            Fluttertoast.showToast(
                                msg: "pleaselogintoaddtofavourite".tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                        }, //addHandler,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fillColor: Colors.grey[400],
                        constraints: BoxConstraints.tightFor(
                          width: getProportionateScreenWidth(
                            30,
                          ),
                          height: getProportionateScreenWidth(
                            30,
                          ),
                        ),
                        elevation: 0,
                        child: Icon(
                          Icons.favorite_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
