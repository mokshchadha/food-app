import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String id;
  // final String title;
  // final Color color;
  static const String routeName = '/categoryMeals';

  // CategoryMealsScreen(
  //     {required this.id, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final String categoryTitle =
        routeArgs['title'] != null ? routeArgs['title'].toString() : "NA";

    final Color categoryColor = routeArgs['color'] != null
        ? (routeArgs['color']) as Color
        : Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: Center(
        child: Text('these are $categoryTitle recipies'),
      ),
    );
  }
}
