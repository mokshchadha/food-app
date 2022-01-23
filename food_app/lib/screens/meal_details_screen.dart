import 'package:flutter/material.dart';
import 'package:food_app/widgets/meal_card.dart';

import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = '/mealDetails';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: Text('categoryTitle'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, idx) {
            return Text('helo');
          },
          itemCount: 1,
        ),
      ),
    );
  }
}
