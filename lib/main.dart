import 'package:flutter/material.dart';

import 'utils/app_routes.dart';

import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/categories_meals_screens.dart';
import 'screens/settings_screen.dart';

import 'models/settings.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(const Meals());

class Meals extends StatefulWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vamos cozinhar?",
      // home: const CategoriesScreen(),
      theme: ThemeData(
        fontFamily: 'Raleway',
        canvasColor: const Color.fromARGB(255, 254, 229, 225),
        primaryColor: Colors.pink,
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (cxt) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (cxt) =>
            MealDetailScreen(_isFavorite, _toggleFavorite),
        AppRoutes.SETTINGS: (cxt) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
