import 'package:flutter/material.dart';

class IconSection extends StatelessWidget {
  final List<IconData> icons;
  final List<String> titles;

  const IconSection({Key? key, required this.icons, required this.titles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconWidth = screenWidth / 5; // Adjust the width for the icons dynamically

    return SizedBox(
      height: iconWidth * 1.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: icons.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Container(
                  height: iconWidth * 0.8,
                  width: iconWidth * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Icon(
                    icons[index],
                    size: iconWidth * 0.5,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  titles[index],
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Set the title color to white
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
