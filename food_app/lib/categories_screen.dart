import 'package:flutter/material.dart';
import 'package:food_app/category_item.dart';

import './data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Moksh Restraunt'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(15),
          children: DUMMY_CATEGORIES
              .map(
                  (e) => CategoryItem(id: e.id, color: e.color, title: e.title))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ), // a pre configured class that allows us to create width items and automatically it scalses to as many columns that can be provided with that width
        ));
  }
}
