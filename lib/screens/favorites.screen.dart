import 'package:flutter/material.dart';

import '../widgets/mealItems.widget.dart';

class FavoritesScreen extends StatelessWidget {
  final List favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
      child: Text('No meal favorites yet! - start adding some')
    );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            removeItem: null,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}