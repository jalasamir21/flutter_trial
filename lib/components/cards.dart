import 'package:trial/components/blurred_card.dart';
import 'package:trial/components/favourite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:trial/screens/hotel_screen.dart';

class Cards extends StatefulWidget {
  final String imagePath;
  final String placeName;
  final String countryName;
  final double rating;
  final int price;
  final String hotel1Path;

  const Cards({
    super.key,
    required this.imagePath,
    required this.countryName,
    required this.rating,
    required this.price,
    required this.placeName,
    required this.hotel1Path,
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return InkWell( // Use InkWell for the tap gesture
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelScreen(
              placeName: widget.placeName,
              countryName: widget.countryName,
              rating: widget.rating,
              price: widget.price,
              hotel1Path: widget.hotel1Path,
              distance: 245,
              available: 5,
              hotelName: "Hilton",
            ),
          ),
        );
      },
      child: BlurredCard(
        tChild: Column(
          children: [
            SizedBox(height:3),
            Container(
              width: 200,
              height: 120,
              child: Image.asset(widget.imagePath),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            ),
            Row(
              children: [
                SizedBox(width: 5),
                Text(
                  widget.placeName,
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                SizedBox(width: 50),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 10,
                ),
                Text(
                  "${widget.rating}",
                  style: TextStyle(fontSize: 9, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 13,
                ),
                Text(
                  widget.countryName,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '\$${widget.price}',
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
                Text(
                  "/visit",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(width: 20),
                FavoriteIconButton(),
                // Icon(Icons.favorite_outline_outlined),
              ],
            ),
          ],
        ),
        tWidth: 150,
        tHeight: 222,

      ),
    );
  }
}

