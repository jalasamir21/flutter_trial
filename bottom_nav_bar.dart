import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'wishlist_page.dart';
import 'home_page.dart';
import 'notifications_page.dart';
import 'user_profile.dart';
import 'detail_booking.dart';

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

  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    // Initialize the pages with the passed user details
    pages = [
      HomePage(),
      const WishlistPage(),
      const NotificationsPage(),
      UserProfilePage(  // Pass user details to UserProfilePage
        name: widget.name,
        email: widget.email,
        phone: widget.phone,
      ),
    ];
  }

  void navigateToPage(int newIndex) {
    if (index == newIndex) return;

    setState(() {
      index = newIndex;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => pages[newIndex]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        navigateToPage(itemIndex); // Navigate to the selected page
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
