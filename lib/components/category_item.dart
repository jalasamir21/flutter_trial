import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap; // Callback for when the button is tapped

  const CategoryItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap, // Add the callback in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // This is the click handler
      borderRadius: BorderRadius.circular(25), // For ripple effect shape
      splashColor: Colors.purple.withOpacity(0.5), // Optional ripple effect color
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.purple, // Color for the icon background
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
