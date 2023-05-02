import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class IndiDealCard extends StatelessWidget {
  final bool? isLeft;
  final bool isSelected;
  final bool noPadding;
  final String title;
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
      this.noPadding = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !noPadding
          ? EdgeInsets.only(
              left: isLeft! ? getProportionateScreenWidth(16.0) : 0,
              right: isLeft! ? 0 : getProportionateScreenWidth(16.0),
            )
          : EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(8.0),
        ),
        margin: EdgeInsets.all(
          getProportionateScreenWidth(4.0),
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(
              8,
            ),
          ),
          boxShadow: [
            isSelected
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
                child: Image.asset(
                  '$imageurl',
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
                    '$title',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        //fontWeight: FontWeight.w700,
                        ),
                  ),
                  Spacer(),
                  Text(
                    '$catagory',
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
                          '\$$price',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {}, //addHandler,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fillColor: kPrimaryGreen,
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
