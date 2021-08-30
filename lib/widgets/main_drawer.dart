import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget tileBuilder(String title, Icon icon, Function()? tapHandler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.only(top: 70, right: 20, left: 20, bottom: 20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          tileBuilder(
              'Meals',
              Icon(
                Icons.restaurant_menu_outlined,
              ), () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          tileBuilder(
              'Settings',
              Icon(
                Icons.settings_outlined,
              ), () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
