import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/bloc/home_bloc.dart';
import 'package:trial/Screens/wishlist_page.dart';
import 'package:trial/bloc/home_state.dart';

class FeaturedDestinations extends StatelessWidget {
  final List<Map<String, dynamic>> destinations; // Accept destinations as a parameter

  const FeaturedDestinations({
    Key? key,
    required this.destinations, // Updated constructor to receive destinations
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.error != null) {
          return Center(child: Text(state.error!));
        }

        // Use the destinations passed in the constructor instead of state.destinations
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Popular Packages in Asia',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 300.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length, // Use the destinations passed in
                itemBuilder: (BuildContext context, int index) {
                  return _buildDestinationCard(context, destinations[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDestinationCard(BuildContext context, Map<String, dynamic> destination) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 210.0,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            bottom: 15.0,
            child: Container(
              height: 140.0,
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
                      destination['name'],
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
                    const SizedBox(height: 5.0),
                    // Display star rating
                    _buildStarRating(destination['rating']),
                    const SizedBox(height: 5.0),
                    // Display review count
                    Text(
                      '${destination['reviewCount']} reviews',
                      style: const TextStyle(color: Colors.grey),
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
              child: Image.network(
                destination['image'], // Use network image
                height: 180.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: GestureDetector(
              onTap: () {
                // Navigate to wishlist page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WishlistPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build star rating
  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor(); // Get the number of full stars
    int halfStars = (rating - fullStars >= 0.5) ? 1 : 0; // Determine if there's a half star
    int emptyStars = 5 - fullStars - halfStars; // Calculate the number of empty stars

    // Create a list of stars
    List<Widget> stars = [];

    // Add full stars
    stars.addAll(List.generate(
      fullStars,
      (index) => const Icon(Icons.star, color: Colors.yellow),
    ));

    // Add half star
    if (halfStars == 1) {
      stars.add(const Icon(Icons.star_half, color: Colors.yellow));
    }

    // Add empty stars
    stars.addAll(List.generate(
      emptyStars,
      (index) => const Icon(Icons.star_border, color: Colors.yellow),
    ));

    return Row(
      children: stars,
    );
  }
}
