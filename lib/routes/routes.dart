import '../screens/categories.screen.dart';
import '../screens/categoryMeals.screen.dart';
import '../screens/mealDetails.screen.dart';

import './routes.names.dart';

final routes = {
  routeNames['homeScreen']: (ctx) => CategoriesScreen(),
  routeNames['categoryMealsScreen']: (ctx) => CategoryMealsScreen(),
  routeNames['mealDetails']: (ctx) => MealDetails()
};
