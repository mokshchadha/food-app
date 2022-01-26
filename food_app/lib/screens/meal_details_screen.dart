import 'package:flutter/material.dart';
import 'package:food_app/widgets/meal_card.dart';

import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = '/mealDetails';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    final mealId = routeArgs['id'];

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget sectionTitle(context, title) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: Theme.of(context).textTheme.bodyText1));

    Widget containerWithStyle(context, childWidget) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: 200,
          width: 300,
          child: childWidget,
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle(context, 'Ingredients'),
            containerWithStyle(
              context,
              ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: ListTile(
                        leading: Text('${idx + 1}'),
                        title: Text(selectedMeal.ingredients[idx])),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            sectionTitle(context, 'Steps'),
            containerWithStyle(
              context,
              ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Text('${idx + 1} ${selectedMeal.steps[idx]}');
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
