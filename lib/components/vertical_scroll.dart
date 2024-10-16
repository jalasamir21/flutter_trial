import 'package:flutter/material.dart';
import 'hotel_card.dart'; // Assuming this is where HotelCard is defined

class VerticalScroll extends StatelessWidget {
  final List<Map<String, dynamic>> hotels = [
    {
      'hotel1Path': 'assets/images/hotel5.png',
      'placeName': 'RedFish Lake',
      'countryName': 'USA',
      'rating': 4.5,
      'price': 100,
      'distance': 5,
      'available': 3,
      'hotelName': 'Mountain Inn',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: HotelCard(
                    hotel1Path: hotel['hotel1Path'],
                    placeName: hotel['placeName'],
                    countryName: hotel['countryName'],
                    rating: hotel['rating'],
                    price: hotel['price'],
                    distance: hotel['distance'],
                    available: hotel['available'],
                    hotelName: hotel['hotelName'],
                  ),
                );
              }
    );

    }}