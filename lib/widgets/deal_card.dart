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
    return  GestureDetector(
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
                     ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
