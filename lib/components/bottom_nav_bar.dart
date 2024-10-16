import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trial/Screens/wishlist_page.dart';
import '../screens/home_page.dart';
import 'package:trial/Screens/notifications_page.dart';
import '../screens/user_profile.dart';

class BottomNavBar extends StatefulWidget {
  final String name; // User's name
  final String email; // User's email
  final String phone; // User's phone

  const BottomNavBar({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    // Initialize the pages with the passed user details
    pages = [
      HomePage(),
      WishlistPage(),
      NotificationsPage(),
      UserProfilePage(
        name: widget.name,
        email: widget.email,
        phone: widget.phone,
      ),
    ];
  }

  void navigateToPage(int newIndex) {
    setState(() {
      index = newIndex; // Update the index to show the selected page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index, // Keep the current page
        children: pages, // Display the pages
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: kIsWeb
              ? Container(
                  color: Colors.white,
                  child: _buildNavBarContent(),
                )
              : Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(129, 21, 122, 1),
                      ],
                    ),
                  ),
                  child: _buildNavBarContent(),
                ),
        ),
      ),
    );
  }

  Row _buildNavBarContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavBarItem(CupertinoIcons.home, 'Home', 0),
        _buildNavBarItem(CupertinoIcons.heart, 'Wishlist', 1),
        _buildNavBarItem(CupertinoIcons.bell, 'Notifications', 2),
        _buildNavBarItem(CupertinoIcons.person, 'Profile', 3),
      ],
    );
  }

  MaterialButton _buildNavBarItem(IconData icon, String label, int itemIndex) {
    return MaterialButton(
      onPressed: () {
        navigateToPage(itemIndex); // Navigate to the selected page by updating the index
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: index == itemIndex ? Colors.purple : Colors.grey, // Active color for selected item
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              color: index == itemIndex ? Colors.purple : Colors.grey, // Active color for selected item
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
