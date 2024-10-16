import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String textfield;
  final IconData icon;
  final TextEditingController controller; // Added controller as a required parameter

  InputBox(this.textfield, this.icon, {required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: TextFormField(
        controller: controller, // Set the controller here
        style: const TextStyle(color: Colors.white), // Text color set to white
        decoration: InputDecoration(
          labelText: textfield,
          labelStyle: const TextStyle(color: Colors.white), // Label text color set to white
          prefixIcon: Icon(icon, color: Colors.white), // Icon color set to white
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow), // Border color when enabled
            borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded border radius
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow), // Border color when focused
            borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded border radius
          ),
        ),
      ),
    );
  }
}