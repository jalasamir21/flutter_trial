import 'package:flutter/material.dart';
import 'category_item.dart';
import'cards.dart';

Widget ScrollsView() {
  final List<Map<String, dynamic>> locations = [
    {
      'imagePath': 'assets/images/Rectangle7.png',
      'placeName': 'RedFish Lake',
      'rating': 4.5,
      'price': 40,
      'countryName': 'Idaho',
      'hotelPath' : 'assets/images/hotel5.png',
    },
    {
      'imagePath': 'assets/images/Rectangle7-1.png',
      'placeName': 'Magnolia Lake',
      'rating': 4.5,
      'price': 40,
      'countryName': 'Canada',
      'hotelPath' : 'assets/images/hotel5.png',
    },
    {
      'imagePath': 'assets/images/Rectangle7-1.png',
      'placeName': 'Magnolia Lake',
      'rating': 4.5,
      'price': 40,
      'countryName': 'Canada',
      'hotelPath' : 'assets/images/hotel5.png',
    },


  ];

  return Container(
    height: 222, // Adjust height as needed
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Cards(
              imagePath: location['imagePath'],
              placeName: location['placeName'],
              rating: location['rating'],
              price: location['price'],
              countryName: location['countryName'],
              hotel1Path: location['hotelPath'],
        ),);
      },
    ),
  );
}
