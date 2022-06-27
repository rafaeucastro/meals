import 'package:flutter/material.dart';
import 'package:meals/screens/meal_detail_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/categories_meals_screens.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';

import 'utils/app_routes.dart';

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
        textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.amber,
          primarySwatch: Colors.pink,
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (cxt) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (cxt) => const MealDetailScreen(),
      },
    );
  }
}
