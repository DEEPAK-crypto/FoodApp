import 'package:flutter/material.dart';
import 'package:foods_app/category_item.dart';

import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DeliMeals',
          style: TextStyle(
            color: Color.fromRGBO(255, 72, 72, 1),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(
            catData.id,
            catData.title,
            catData.color,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
