import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() => runApp(const Meals());

class Meals extends StatelessWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vamos cozinhar?",
      home: const CategoriesScreen(),
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
    );
  }
}
