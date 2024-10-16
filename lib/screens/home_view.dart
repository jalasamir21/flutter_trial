import 'package:flutter/material.dart';
import 'package:trial/components/blurred_card.dart';
import 'package:trial/components/cards.dart';
import 'package:trial/components/build_categories.dart';
import 'package:trial/components/gradient_color.dart';
import 'package:trial/components/build_categories.dart';
import 'package:trial/components/search_bar.dart';

import 'package:trial/components/place_details.dart';
import 'package:trial/components/scrolls_view.dart';
import 'package:trial/components/custom_search_bar_delegate.dart';
import 'package:trial/screens/wishlist_page.dart';
import 'package:trial/screens/user_profile.dart';
import 'package:trial/screens/notifications_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // List of pages corresponding to each BottomNavigationBar item
  final List<Widget> _pages = [
    HomePage(), // Your home content
    LocationPage(), // Your location content
    WishlistPage(), // Your favorites content
    UserProfilePage(name: "Jala Samir",email: "jalasamir666@gmail.com",phone: "01098765431"),
    // ProfilePage(),// Your profile content
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientColor(),
          IndexedStack(
            index: _selectedIndex,  // Display the selected page
            children: _pages,
          ),
        ],
      ),
      bottomNavigationBar: BlurredCard(
        tHeight: 60,
        tWidth: 500,
        tChild: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Separate pages for each tab in BottomNavigationBar
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: 50),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.all(20.0),
          alignment: Alignment.topLeft,
          child: Text(
            "Location",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.8,
          indent: 0,
          endIndent: 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.purple, size: 30),
                    SizedBox(width: 5),
                    Text("New York, USA",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            SizedBox(width: 80),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );

              },
              icon: Icon(Icons.notification_add_rounded,
                  color: Colors.purple, size: 30),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 15),

            const CustomSearchBar(),

            Container(
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.purple,
              ),
              child: IconButton(
                onPressed: () {},
                iconSize: 32,
                icon: const Icon(Icons.filter_list),
              ),
            ),
            SizedBox(width: 11),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Categories",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            SizedBox(width: 60),
            InkWell(
              onTap: () {},
              child: Text("See All",
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            ),
          ],
        ),
        SizedBox(height: 20),
        BuildCategories(),
        ScrollsView(),
        SizedBox(height: 30),
        PlaceDetails(
            countryName: "USA",
            rating: 5,
            description:
            "The United States of America, often referred to as the USA, is a vast and diverse country located in North America. Known for its iconic cities like New York, Los Angeles, the USA is home to a wide range of landscapes. "),
      ],
    );
  }
}

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Location Page"));
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Favorites Page"));
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Page"));
  }
}

