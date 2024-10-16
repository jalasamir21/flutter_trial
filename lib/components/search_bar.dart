import 'package:flutter/material.dart';

import '../screens/city_view.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: Border.all(color: Color(0xFFD8D0D0), width: 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        alignment: Alignment.topLeft,
        onPressed: () {
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
        icon: const Icon(Icons.search, color: Colors.purple),
      ),
    );
  }
}


