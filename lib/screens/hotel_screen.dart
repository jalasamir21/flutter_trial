import 'package:trial/components/blurred_card.dart';
import 'package:flutter/material.dart';
import 'package:trial/components/gradient_color.dart';
import 'package:trial/components/hotel_card.dart';
import 'package:trial/components/vertical_scroll.dart';

class HotelScreen extends StatelessWidget {

  final String hotel1Path;
  final String placeName;
  final String countryName;
  final double rating;
  final int price;
  final int distance;
  final int available;
  final String hotelName;

  const HotelScreen({
    super.key,
    required this.hotel1Path,
    required this.placeName,
    required this.countryName,
    required this.rating,
    required this.price,
    required this.distance,
    required this.available,
    required this.hotelName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientColor(),
          Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () { Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
                  Text(placeName, style: TextStyle(fontSize: 15, color: Colors.white)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined, color: Colors.white)),
                ],
              ),
              SizedBox(height: 10),
              Divider( // Adding the horizontal line (Divider)
                color: Colors.grey, // Color of the line
                thickness: 0.8,       // Thickness of the line
                indent: 0,         // Start space from the left
                endIndent: 0,      // End space from the right
              ),
              SizedBox(height: 10),
              VerticalScroll(),
              // HotelCard(
              //   hotel1Path: 'assets/images/hotel5.png',
              //   hotelName: "Hilton",
              //   placeName: placeName,
              //   price: 50,
              //   distance: 457,
              //   available: 5,
              //   countryName: "United States",
              //   rating: 4.5,
              //
              // ),
              // SizedBox(height: 50), // Add space below to ensure the full card is visible
              // HotelCard(
              //   hotel1Path: 'assets/images/hotel5.png',
              //   hotelName: "Hilton",
              //   placeName: placeName,
              //   price: 50,
              //   distance: 457,
              //   available: 5,
              //   countryName: "United States",
              //   rating: 4.5,
              //
              // ),
              //
              // SizedBox(height: 50), // Add space below to ensure the full card is visible
            ],
          ),
        ],
      ),
    );
  }
}
