import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product-list', arguments: category);
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(
            category,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
