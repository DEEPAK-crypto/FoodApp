import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String? categoryId;
  // final String? categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryid = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle as String,
          style: TextStyle(
            color: Color.fromRGBO(255, 72, 72, 1),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'The recipes of th ecategory',
        ),
      ),
    );
  }
}
