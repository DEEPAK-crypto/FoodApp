import 'package:flutter/material.dart';
import 'package:foods_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget buildSectionTile(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${selectedMeal.title}',
            style: TextStyle(
              color: Color.fromRGBO(255, 72, 72, 1),
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    selectedMeal.imageUrl as String,
                    fit: BoxFit.cover,
                  ),
                ),
                buildSectionTile("Ingridients", context),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 200,
                  width: 300,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          selectedMeal.ingredients![index],
                        ),
                      ),
                    ),
                    itemCount: selectedMeal.ingredients!.length,
                  ),
                ),
                buildSectionTile("Steps", context),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 200,
                  width: 300,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps![index]),
                        ),
                        Divider()
                      ],
                    ),
                    itemCount: selectedMeal.steps!.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: isFavourite(selectedMeal.id)
              ? Icon(
                  Icons.star,
                  color: Color.fromRGBO(255, 72, 72, 1),
                )
              : Icon(Icons.star_border_outlined),
          onPressed: () {
            toggleFavourite(selectedMeal.id);
          },
        ));
  }
}
