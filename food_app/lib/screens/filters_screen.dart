import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static final String routeName = '/filtersScreen';

  final Function saveFilters;

  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  void _saveFilters() {
    widget.saveFilters({
      'glutenFree': _glutenFree,
      'lactoseFree': _lactoseFree,
      'vegan': _vegan,
      'vegeterian': _vegeterian
    });
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['glutenFree'] != null
        ? widget.currentFilters['glutenFree'] as bool
        : false;
    _lactoseFree = widget.currentFilters['lactoseFree'] != null
        ? widget.currentFilters['lactoseFree'] as bool
        : false;
    _vegan = widget.currentFilters['vegan'] != null
        ? widget.currentFilters['vegan'] as bool
        : false;
    _vegeterian = widget.currentFilters['vegeterian'] != null
        ? widget.currentFilters['vegeterian'] as bool
        : false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(onPressed: _saveFilters, icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            child: const Text('Adjust your meal selection'),
            padding: const EdgeInsets.all(20),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                  value: _glutenFree,
                  title: const Text('Gluten Free'),
                  subtitle: const Text('Only include Gluten Free Meal'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              SwitchListTile(
                  value: _vegan,
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include Vegan  Meal'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
              SwitchListTile(
                  value: _vegeterian,
                  title: const Text('Vegeterian'),
                  subtitle: const Text('Only include Vegetarian Meal'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  }),
              SwitchListTile(
                  value: _lactoseFree,
                  title: const Text('Lactose Free'),
                  subtitle: const Text('Only include Lactose Free Meal'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  })
            ],
          ))
        ],
      ),
    );
  }
}
