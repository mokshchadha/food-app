import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/meal_details_screen.dart';

class MealCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final String id;
  final Function removeItem;

  MealCard(
      {required this.imageUrl,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.title,
      required this.id,
      required this.removeItem});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get availabilityText {
    switch (affordability) {
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailsScreen.routeName, arguments: {
      'id': id,
    }).then((mealIdWhichIsDeleted) {
      print(mealIdWhichIsDeleted);
      mealIdWhichIsDeleted != null ? removeItem(mealIdWhichIsDeleted) : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 23.0,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.black54,
                    child: Row(
                      children: [
                        Row(children: [
                          const Icon(Icons.schedule, color: Colors.white),
                          const SizedBox(width: 6),
                          Text('$duration mins',
                              style: const TextStyle(color: Colors.white))
                        ]),
                        Row(children: [
                          const Icon(Icons.money, color: Colors.white),
                          const SizedBox(width: 6),
                          Text(
                            availabilityText,
                            style: const TextStyle(color: Colors.white),
                          )
                        ]),
                        Row(children: [
                          const Icon(Icons.work, color: Colors.white),
                          const SizedBox(width: 6),
                          Text(complexityText,
                              style: const TextStyle(color: Colors.white))
                        ])
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
