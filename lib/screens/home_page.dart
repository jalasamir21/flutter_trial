import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/bloc/home_event.dart';
import 'package:trial/bloc/home_state.dart';
import 'package:trial/components/bottom_nav_bar.dart';
import 'package:trial/components/featured_destinations.dart';
import 'package:trial/components/expanding_trip.dart';
import 'package:trial/components/icon_section.dart';
import 'package:trial/components/search_bar.dart';
import 'package:trial/bloc/home_bloc.dart'; 
import 'package:trial/components/gradient_color.dart'; // Import the GradientColor widget

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadDestinationsEvent()), // Load destinations when the page is built
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
             GradientColor(), // Use the GradientColor widget here
            SafeArea(
              child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.error != null) {
                  return Center(child: Text(state.error!));
                }

                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Column(
                    children: [
                      // Section with background image for search and icons
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/background_image.jpg'),
                            fit: BoxFit.cover,
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
                             customSearchBar(), // Use SearchBar component
                            const SizedBox(height: 20.0),
                            IconSection( // Use IconSection component
                              icons: [
                                Icons.flight,
                                Icons.hotel,
                                Icons.directions_walk,
                                Icons.directions_bike,
                              ],
                              titles: [
                                'Flights',
                                'Hotels',
                                'Experiences',
                                'Biking'
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            // Featured Destinations Section
                            FeaturedDestinations(
                              destinations: state.destinations, // Pass destinations from state
                            ),
                            const SizedBox(height: 20.0),
                            // Expanding Your Trip Around the World Section
                            ExpandingTripSection(
                              destinations: state.destinations, // Ensure this matches the expected input for ExpandingTripSection
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(
          name: 'User', // Placeholder name
          email: 'email@example.com', // Placeholder email
          phone: '123456789', // Placeholder phone
        ),
      ),
    );
  }
}
