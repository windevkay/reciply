import '../screens/categories.screen.dart';
import '../screens/categoryMeals.screen.dart';

import './routes.names.dart';

final routes = {
  routeNames['homePage']: (ctx) => CategoriesScreen(),
  routeNames['categoryMealsPage']: (ctx) => CategoryMealsScreen(),
};
