import 'package:flutter/material.dart';

import '../routes/routes.names.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'OpenSans', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, (){
            //push replacement is better for tab performance issues
            //ensure we dont create a growing stack of screens but rather they are replaced
            Navigator.of(context).pushReplacementNamed(routeNames['homeScreen']);
          }),
          buildListTile('Filter Settings', Icons.settings, (){
            Navigator.of(context).pushReplacementNamed(routeNames['filters']);
          }),
        ],
      ),
    );
  }
}
