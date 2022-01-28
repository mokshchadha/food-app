import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/meal_card.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favouriteMeals.isEmpty
          ? const Center(child: Text('No favourites added yet!'))
          : ListView.builder(
              itemBuilder: (ctx, idx) {
                var meal = favouriteMeals[idx];
                return MealCard(
                  imageUrl: meal.imageUrl,
                  affordability: meal.affordability,
                  complexity: meal.complexity,
                  duration: meal.duration,
                  title: meal.title,
                  id: meal.id,
                  removeItem: () {},
                );
              },
              itemCount: favouriteMeals.length,
            ),
    );
  }
}
