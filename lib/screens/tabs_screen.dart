import 'package:flutter/material.dart';
import './favourite_screen.dart';
import './categories_screen.dart';

class TabScreens extends StatefulWidget {
  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category_outlined),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star_border_outlined),
                  text: 'Favourite',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavouriteScreen(),
            ],
          ),
        ));
  }
}
