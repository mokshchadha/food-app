import 'package:flutter/material.dart';
import 'package:food_app/widgets/meal_card.dart';

import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/categoryMeals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    final String categoryTitle = routeArgs['title'].toString();

    final Color categoryColor = routeArgs['color'] != null
        ? (routeArgs['color']) as Color
        : Theme.of(context).primaryColor;

    final String categoryId = routeArgs['id'].toString();

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, idx) {
            var meal = categoryMeals[idx];
            return MealCard(
              imageUrl: meal.imageUrl,
              affordability: meal.affordability,
              complexity: meal.complexity,
              duration: meal.duration,
              title: meal.title,
              id: meal.id,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
