import 'package:flutter/material.dart';
import 'package:foods_app/models/meal.dart';
import 'package:foods_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String? categoryId;
  // final String? categoryTitle;

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String?, String?>;
    final categoryTitle = routeArgs['title'];
    final categoryid = routeArgs['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories!.contains(categoryid);
    }).toList();

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
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              categoryMeals[index].id,
              categoryMeals[index].title,
              categoryMeals[index].imageUrl,
              categoryMeals[index].duration,
              categoryMeals[index].complexity,
              categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
