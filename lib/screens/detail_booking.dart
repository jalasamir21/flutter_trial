import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../components/gradient_color.dart';
import '../components/text_field_component.dart'; // Import the text field component
import '../components/total_amount_display.dart'; // Import the total amount component
import '../services/api_service.dart';
import 'user_profile.dart';

class DetailBookingPage extends StatelessWidget {
  DetailBookingPage({super.key});

  final TextEditingController _guestNameController = TextEditingController();
  final TextEditingController _guestNumberController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();

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

    // Trigger UserBloc to fetch user profile after form submission
    final userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(FetchUser()); // Trigger fetch user event

    // Navigate to UserProfilePage and pass user details
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfilePage(
          name: _guestNameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: GradientColor.getGradient(),
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
              CustomTextField(label: 'Guest Name', controller: _guestNameController),
              CustomTextField(label: 'Guest Number', controller: _guestNumberController),
              CustomTextField(label: 'Phone', controller: _phoneController),
              CustomTextField(label: 'Email', controller: _emailController),
              CustomTextField(label: 'ID Number (hidden)', controller: _idNumberController, isObscured: true),
              const SizedBox(height: 20.0),
              TotalAmountDisplay(totalAmount: calculateTotal()), // Use the total amount component
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: GradientColor.getGradient(),
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
}
