import 'package:flutter/material.dart';
import 'package:foods_app/models/meal.dart';
import 'package:foods_app/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
          child: Text('You have no favourites yet - start adding some!'));
    } else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              favouriteMeals[index].id,
              favouriteMeals[index].title,
              favouriteMeals[index].imageUrl,
              favouriteMeals[index].duration,
              favouriteMeals[index].complexity,
              favouriteMeals[index].affordability);
        },
        itemCount: favouriteMeals.length,
      );
  }
}
