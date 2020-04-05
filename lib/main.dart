import 'package:flutter/material.dart';

import './routes/routes.dart';
import './screens/tabs.screen.dart';
import './models/meal.model.dart';

import './dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reciply',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amber,
        //canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(fontSize: 15, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: returnRoutes(_setFilters, _filters, _availableMeals),
      //flutter routes for fallbacks and handling weird route situations
      onGenerateRoute: (settings) {//will default to this route if route isnt found in routes table
      //you can use the default settings arg available in this function to dynamically
      //decide what screen to render. this can happen if routes are generated on the fly
      // if(settings.name == './my-dynamic-route'){
      //   return 'material page route with some screen';
      // }
        return MaterialPageRoute(builder: (ctx) => TabScreen());
      },
      onUnknownRoute: (settings) {//this one is a last resort function that can be used if route isnt found on routes table
      //and also if on generate route is not defined
        return MaterialPageRoute(builder: (ctx) => TabScreen());
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Text('Navigation time'),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
