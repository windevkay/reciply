import 'package:flutter/material.dart';

import '../widgets/categoryItems.widget.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reciply',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.amber,
              fontFamily: 'Acme',
              fontSize: 22),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map((category) => CategoryItem(category.title, category.color, category.id))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
