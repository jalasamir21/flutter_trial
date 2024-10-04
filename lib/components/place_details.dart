import 'package:flutter/material.dart';
import 'package:trial/components/blurred_card.dart';

Widget PlaceDetails({
  required String countryName,
  required double rating,
  required String description,
}) {
  return BlurredCard(
    tHeight: 200,
    tWidth: 400,
    tChild: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel Title
          Text(
            " $countryName",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),

          // Country Name and Rating
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.grey),
              SizedBox(width: 5),
              Text(
                "$countryName",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Spacer(),
              Icon(Icons.star, color: Colors.purple, size: 20),
              SizedBox(width: 5),
              Text(
                "$rating",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Paragraph Description
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.white),
            textAlign: TextAlign.justify,  // makes the paragraph justified
          ),
        ],
      ),
    ),
  );
}
