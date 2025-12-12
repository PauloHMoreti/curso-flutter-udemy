import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        primarySwatch: Colors.pink,
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"),
        ),
      ),
      routes: {
        AppRoutes.home: (_) => CategoriesScreen(),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}
