import 'package:flutter/material.dart';

import '../routes/routes.names.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.title, this.color, this.id);

  //handles our on tap
  //push named pushes the specified arguments to the specified route
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      routeNames['categoryMealsScreen'], arguments: {'id': id, 'title': title}
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //inkwell is similar to gesture detector, but with a nice ripple effect :)
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      //the border radius below should match that of the box decoration to ensure the splash fills rhe whole box
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
