import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class DealCard extends StatelessWidget {
  final bool isHorizontalScrolling;
  final void Function()? onTap;
  final String? title;
  final String? description;
  final String? price;
  final String? imageurl;
  //final Function onTap;
//this.onTap,
  const DealCard(
      {this.isHorizontalScrolling = true,
      this.onTap,
      required this.title,
      required this.description,
      required this.price,
      required this.imageurl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //height:300,
        alignment: Alignment.bottomLeft,
        width: getProportionateScreenWidth(280),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(color: Colors.black),
                      Shadow(color: Color.fromARGB(255, 154, 110, 68)),
                    ]),
              ),
              Text(
                '$price',
                style: TextStyle(color: Theme.of(context).primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
