import 'package:flutter/material.dart';
import 'package:food_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(titleText, iconData, tapFunction) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      onTap: tapFunction,
      title: Text(
        titleText as String,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
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
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text('What\'s Cooking ?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              )),
        ),
        const SizedBox(height: 20),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushNamed('/');
        }),
        buildListTile('Filters', Icons.settings, () {
          Navigator.of(context).pushNamed(FiltersScreen.routeName);
        }),
      ],
    ));
  }
}
