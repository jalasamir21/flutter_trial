import 'package:flutter/material.dart';

class customSearchBar extends StatelessWidget {
  const customSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: const Color(0x55434343),
      child: const TextField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          hintText: 'Search for destinations, hotels, etc.',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
