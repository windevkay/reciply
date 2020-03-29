import 'package:flutter/material.dart';

import './routes/routes.dart';
import './screens/categories.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reciply',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
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
      routes: routes,
      //flutter routes for fallbacks and handling weird route situations
      onGenerateRoute: (settings) {//will default to this route if route isnt found in routes table
      //you can use the default settings arg available in this function to dynamically
      //decide what screen to render. this can happen if routes are generated on the fly
      // if(settings.name == './my-dynamic-route'){
      //   return 'material page route with some screen';
      // }
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {//this one is a last resort function that can be used if route isnt found on routes table
      //and also if on generate route is not defined
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
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
