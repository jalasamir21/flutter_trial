import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; // Import your BottomNavBar
import 'featured_destinations.dart'; // Import the FeaturedDestinations class
import 'expanding_trip.dart'; // Import the ExpandingTripSection class

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> _destinations = [
    'Bali, Indonesia',
    'Paris, France',
    'Tokyo, Japan',
    'New York, USA',
    'Dubai, UAE',
  ];

  final List<String> _destinationImages = [
    'assets/lib/th.jpg',
    'assets/lib/th (2).jpg',
    'assets/lib/tokyo.jpg',
    'assets/lib/th (1).jpg',
    'assets/lib/dubia.jpg',
  ];

  final List<double> _ratings = [
    4.5,
    4.0,
    5.0,
    3.5,
    4.8,
  ]; // Sample ratings for each destination

  final List<int> _reviewCounts = [
    150,
    200,
    300,
    75,
    120,
  ]; // Sample review counts for each destination

  final List<IconData> _icons = [
    Icons.flight,
    Icons.hotel,
    Icons.directions_walk,
    Icons.directions_bike,
  ];

  final List<String> _iconTitles = [
    'Flights',
    'Hotels',
    'Experiences',
    'Biking'
  ];

  Widget _buildIcon(int index, double iconWidth) {
    return Column(
      children: [
        Container(
          height: iconWidth * 0.8,
          width: iconWidth * 0.8,
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(
            _icons[index],
            size: iconWidth * 0.5,
            color: Colors.purple,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          _iconTitles[index],
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Set the title color to white
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconWidth = screenWidth / 5; // Adjust the width for the icons dynamically

    return Scaffold(
      extendBody: true, // Allows the body to extend beneath the bottom navigation bar
      body: Stack(
        children: [
          // Background gradient
          Container(
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
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    children: <Widget>[
                      // Section with background image for search and icons
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/background_image.jpg'), // Update with your image path
                            fit: BoxFit.cover, // Adjust the image to cover the entire container
                          ),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                  children: [
                    const Text(
                      'Explore the world today',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Discover',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Take your travel to the next level',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                            Material(
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
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              height: iconWidth * 1.5,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _icons.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: _buildIcon(index, iconWidth),
                                  );
                                },
                              ),
                              
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      // Featured Destinations Section
                      FeaturedDestinations(
                        destinations: _destinations,
                        destinationImages: _destinationImages,
                        ratings: _ratings,
                        reviewCounts: _reviewCounts,
                      ),
                      const SizedBox(height: 20.0),
                      // Expanding Your Trip Around the World Section
                      ExpandingTripSection(
                        destinations: _destinations,
                        destinationImages: _destinationImages,
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        name: 'User', // Placeholder name
        email: 'email@example.com', // Placeholder email
        phone: '123456789', // Placeholder phone
      ),
    );
  }
}
