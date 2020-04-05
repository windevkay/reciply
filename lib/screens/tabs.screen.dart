import 'package:flutter/material.dart';

import './categories.screen.dart';
import './favorites.screen.dart';
import '../widgets/mainDrawer.widget.dart';

class TabScreen extends StatefulWidget {
  final List favoriteMeals;
  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    //we are using init state here cos we need access to favoritemeals via the widget object
    //which isnt available to use except within lifecycles and the build method
    super.initState();
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Reciply'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favorites'}
    ];
  }

  void _selectPage(int index) {
    //this will auto get the index of the tab that is clicked
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.amber,
              fontFamily: 'Acme',
              fontSize: 22),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
