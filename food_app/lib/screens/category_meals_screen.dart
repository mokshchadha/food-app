import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/main_drawer.dart';
import 'package:food_app/widgets/meal_card.dart';

import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/categoryMeals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = '';
  Color categoryColor = Colors.red;
  List<dynamic> displayedMeals = [];
  bool _loadedInitData = false;

  _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

      categoryTitle = routeArgs['title'].toString();

      categoryColor = routeArgs['color'] != null
          ? (routeArgs['color']) as Color
          : Theme.of(context).primaryColor;

      final String categoryId = routeArgs['id'].toString();

      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();

      setState(() {
        _loadedInitData = true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      drawer: MainDrawer(),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, idx) {
            var meal = displayedMeals[idx];
            return MealCard(
              imageUrl: meal.imageUrl,
              affordability: meal.affordability,
              complexity: meal.complexity,
              duration: meal.duration,
              title: meal.title,
              id: meal.id,
              removeItem: _removeItem,
            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
