import 'package:flutter/material.dart';
import 'package:trial/screens/wishlist_page.dart';

class FeaturedDestinations extends StatelessWidget {
  FeaturedDestinations({
    super.key,
    required this.destinations,
    required this.destinationImages,
    required this.ratings,
    required this.reviewCounts,
  });

  final List<String> destinations;
  final List<String> destinationImages;
  final List<double> ratings; // List of ratings for each destination
  final List<int> reviewCounts; // List of review counts for each destination

  final List<bool> isInWishlist =
      List.generate(10, (_) => false); // Assuming you have 10 destinations

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Popular Package in Asia',
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
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildDestinationCard(context, index);
            },
          ),
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
              height: 140.0, // Adjust height as necessary
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
                      destinations[index],
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
                    _buildStarRating(ratings[index]),
                    const SizedBox(height: 5.0),
                    // Display review count
                    Text(
                      '${reviewCounts[index]} reviews',
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
              child: Image(
                height: 180.0,
                width: 200.0, // Adjust width to match container
                image: AssetImage(destinationImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: GestureDetector(
              onTap: () {
                // Toggle wishlist status
                isInWishlist[index] = !isInWishlist[index];
                // Navigate to wishlist page (you can adjust this according to your route structure)
                if (isInWishlist[index]) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WishlistPage(),
                    ), // Replace with your WishlistPage widget
                  );
                }
              },
              child: Icon(
                isInWishlist[index] ? Icons.favorite : Icons.favorite_border,
                color: isInWishlist[index] ? Colors.red : Colors.white,
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
    int halfStars =
        (rating - fullStars >= 0.5) ? 1 : 0; // Determine if there's a half star
    int emptyStars =
        5 - fullStars - halfStars; // Calculate the number of empty stars

    // Create a list of stars
    List<Widget> stars = [];

    // Add full stars
    stars.addAll(List.generate(
        fullStars, (index) => const Icon(Icons.star, color: Colors.yellow)));

    // Add half star
    if (halfStars == 1) {
      stars.add(const Icon(Icons.star_half, color: Colors.yellow));
    }

    // Add empty stars
    stars.addAll(List.generate(emptyStars,
        (index) => const Icon(Icons.star_border, color: Colors.yellow)));

    return Row(
      children: stars,
    );
  }
}
