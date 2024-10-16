import 'package:flutter/material.dart';
//import 'payment_screen.dart';
import 'lib/components/bottom_nav_bar.dart';

class TravelBookingPage extends StatelessWidget {
  TravelBookingPage({super.key});

  final List<String> _destinations = [
    'Bali, Indonesia',
    'Paris, France',
    'Tokyo, Japan',
    'New York, USA',
    'Dubai, UAE',
  ];

  final List<String> _destinationImages = [
    'assets/bali.jpg',
    'assets/paris.jpg',
    'assets/tokyo.jpg',
    'assets/ny.jpg',
    'assets/dubai.jpg',
  ];

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

  // Modified to align text left
  Widget _buildIcon(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
      children: [
        Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(
            _icons[index],
            size: 30.0,
            color: Colors.purple,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          _iconTitles[index],
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left, // Align text to the left
        ),
      ],
    );
  }

  Widget _buildDestinationCard(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 210.0,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            bottom: 15.0,
            child: Container(
              height: 120.0,
              width: 200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _destinations[index],
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      'Explore this beautiful place!',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                height: 180.0,
                width: 180.0,
                image: AssetImage(_destinationImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to create the Featured Destinations section
  Widget _buildFeaturedDestinations() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Popular Package in Asia',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Contrast text with gradient
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _destinations.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildDestinationCard(context, index);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradient background
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
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              // Top section: Header, Search, and Icons in a container with an image background
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                /*  image: const DecorationImage(
                  //  image: AssetImage('images/lib/th.jpeg'), // Background image
                    fit: BoxFit.cover,
                  ),  */
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                      height: 100.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _icons.length, // Restrict to 4 icons
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: _buildIcon(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              _buildFeaturedDestinations(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(name: '', email: '', phone: '',),
    );
  }
}
