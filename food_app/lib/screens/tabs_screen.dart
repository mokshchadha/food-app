import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/main_drawer.dart';
import './favourite_screen.dart';
import './categories_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabScreen(this.favouriteMeals);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<Object, Object>> _pages = [];

  int _selectedPageIdx = 0;

  void _selectPage(int idx) {
    //idx comes naturally from flutter
    setState(() {
      _selectedPageIdx = idx;
    });
  }

  @override
  void initState() {
    setState(() {
      _pages = [
        {
          'widget': CategoriesScreen(),
          'title': 'Meals',
        },
        {
          'widget': FavouritesScreen(widget.favouriteMeals),
          'title': 'Your Favouites',
        },
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text(_pages[_selectedPageIdx]['title'] as String)),
      body: _pages[_selectedPageIdx]['widget'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,

        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex:
            _selectedPageIdx, //necessary to see the un selected and selected color changes **

        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Favourites')
        ],
      ),
    );
  }
}
