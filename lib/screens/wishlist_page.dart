import 'package:flutter/material.dart';
import 'package:trial/components/bottom_nav_bar.dart'; // Import BottomNavBar here

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of favorite places
    final List<Map<String, String>> favoritePlaces = [
      {
        'name': 'Paris',
        'description': 'The city of light with Eiffel Tower and rich culture.',
        'image': 'assets/images/tokyo.jpg', // Replace with actual image path
      },
      {
        'name': 'Bali',
        'description': 'A beautiful island in Indonesia known for its temples and beaches.',
        'image': 'assets/images/th.jpg', // Replace with actual image path
      },
      {
        'name': 'Tokyo',
        'description': 'A vibrant city blending modern and traditional Japan.',
        'image': 'assets/images/tokyo.jpg', // Replace with actual image path
      },
      {
        'name': 'New York',
        'description': 'The city that never sleeps, filled with iconic landmarks.',
        'image': 'assets/images/th.jpg', // Replace with actual image path
      },
      // Add more places as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        backgroundColor: const Color.fromRGBO(109, 65, 206, 1), // Customize to match the theme
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(25, 14, 67, 1),
              Color.fromRGBO(46, 11, 75, 1),
            ],
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: (favoritePlaces.length / 2).ceil(),
          itemBuilder: (context, rowIndex) {
            return _buildRow(favoritePlaces, rowIndex);
          },
        ),
      ),
      // bottomNavigationBar: const BottomNavBar(name: 'Aya', email: 'asdad@dssd', phone: 'xssd',), // Include BottomNavBar for navigation
    );
  }

  // Widget to build a single row of place cards
  Widget _buildRow(List<Map<String, String>> favoritePlaces, int rowIndex) {
    int firstIndex = rowIndex * 2;
    int secondIndex = firstIndex + 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: _buildPlaceCard(favoritePlaces[firstIndex])),
        if (secondIndex < favoritePlaces.length) // Check if the second card exists
          Expanded(child: _buildPlaceCard(favoritePlaces[secondIndex])),
      ],
    );
  }

  // Widget to build a single place card
  Widget _buildPlaceCard(Map<String, String> place) {
    return GestureDetector(
      onTap: () {
        // Handle navigation or interaction
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image of the travel place
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
              child: Image.asset(
                place['image']!,
                height: 120.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    place['description']!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
