import 'package:flutter/material.dart';
import 'category_item.dart';

Widget BuildCategories() {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.pool, 'label': 'Lakes'},
    {'icon': Icons.waves, 'label': 'Sea'},
    {'icon': Icons.terrain, 'label': 'Mountain'},
    {'icon': Icons.forest, 'label': 'Forest'},
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Container(
      height: 50, // Adjust height as necessary
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scroll
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CategoryItem(
              icon: category['icon'],
              label: category['label'],
              onTap: () {},
            ),
          );
        },
      ),
    ),
  );
}
