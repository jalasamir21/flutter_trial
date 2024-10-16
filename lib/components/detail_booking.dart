import 'package:flutter/material.dart';
import 'package:trial/screens/user_profile.dart'; // Import UserProfilePage

class DetailBookingPage extends StatelessWidget {
  DetailBookingPage({super.key});

  final TextEditingController _guestNameController = TextEditingController();
  final TextEditingController _guestNumberController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();

  // Placeholder for calculating total amount per person.
  String calculateTotal() {
    return "\$100"; // Example static value.
  }

  void _navigateBack(BuildContext context) {
    Navigator.pop(context); // Navigate back to the previous page
  }

  void _submitForm(BuildContext context) {
    if (_guestNameController.text.isEmpty ||
        _guestNumberController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    // Navigate to UserProfilePage and pass user details
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfilePage(
          name: _guestNameController.text, // Use guest name from the input
          email: _emailController.text, // Use email from the input
          phone: _phoneController.text, // Use phone from the input
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(25, 14, 67, 1),
              Color.fromRGBO(46, 11, 75, 1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => _navigateBack(context),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Detail Booking',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Get the best out of your trip!',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              _buildTextField('Guest Name', _guestNameController),
              _buildTextField('Guest Number', _guestNumberController),
              _buildTextField('Phone', _phoneController),
              _buildTextField('Email', _emailController),
              _buildTextField('ID Number (hidden)', _idNumberController, isObscured: true),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    calculateTotal(),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(109, 65, 206, 1),
                      Color.fromRGBO(141, 32, 194, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: ElevatedButton(
                  onPressed: () => _submitForm(context),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isObscured = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(98, 79, 187, 1),
                Color.fromRGBO(32, 15, 59, 1),
              ],
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: controller,
            obscureText: isObscured,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
