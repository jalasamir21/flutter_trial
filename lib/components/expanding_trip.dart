import 'package:flutter/material.dart';

class ExpandingTripSection extends StatelessWidget {
  final List<Map<String, dynamic>> destinations; // Adjust this according to your BLoC state

  const ExpandingTripSection({Key? key, required this.destinations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: destinations.map((destination) {
        return ListTile(
          title: Text(destination['name']),
          leading: Image.network(destination['image']),
          subtitle: Text('${destination['reviewCount']} reviews'),
        );
      }).toList(),
    );
  }
}
