import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';
import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard(
    this.category,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: getProportionateScreenWidth(16),
            backgroundColor: category.color,
            child: SizedBox(
              width: getProportionateScreenWidth(25),
              child: Image.asset(
                category.catIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(category.catName)
        ],
      ),
    );
  }
}
