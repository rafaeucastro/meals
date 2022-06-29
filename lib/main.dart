import 'package:flutter/material.dart';

import 'utils/app_routes.dart';

import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/categories_meals_screens.dart';
import 'screens/settings_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(const Meals());

class Meals extends StatelessWidget {
  const Meals({Key? key}) : super(key: key);

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
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (cxt) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (cxt) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (cxt) => const SettingsScreen(),
      },
    );
  }
}
