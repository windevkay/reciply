import '../screens/categoryMeals.screen.dart';
import '../screens/mealDetails.screen.dart';
import '../screens/tabs.screen.dart';
import '../screens/filterSettings.screen.dart';

import './routes.names.dart';

dynamic returnRoutes(Function setFilters, Map filters, List availableMeals, List favoriteMeals, Function addToFavorites, Function isMealFavorite) {
  return {
    routeNames['homeScreen']: (ctx) => TabScreen(favoriteMeals),
    routeNames['categoryMealsScreen']: (ctx) => CategoryMealsScreen(availableMeals),
    routeNames['mealDetails']: (ctx) => MealDetails(addToFavorites, isMealFavorite),
    routeNames['filters']: (ctx) => FilterSettingsScreen(setFilters, filters)
  };
}
