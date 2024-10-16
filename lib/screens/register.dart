import 'package:flutter/material.dart';
import 'package:trial/components//input_box.dart';
import 'login.dart';
import 'home_page.dart'; // Import the HomePage

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false; // Checkbox state

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
          padding: const EdgeInsets.all(20.0), // Padding around the entire column for spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: [
              const SizedBox(height: 50), // Adds spacing at the top

              // Welcome text
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align both rows to the left
                children: [
                  Text(
                    'Let\'s start your',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'journey together..',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Adds spacing between text and image

              // Image at the top
              Center(
                child: Image.asset(
                  'imgs/location.png',
                  height: 180,
                  width: 208,
                ),
              ),
              const SizedBox(height: 20), // Adds spacing between image and inputs

              // Input fields
              Column(
                children: [
                  InputBox('Email', Icons.email),
                  const SizedBox(height: 10), // Adds spacing between fields
                  InputBox('Username', Icons.person),
                  const SizedBox(height: 10),
                  InputBox('Password', Icons.lock),
                ],
              ),
              const SizedBox(height: 20), // Adds spacing before the checkbox

              // Custom checkbox without yellow border and with same rounded style
              Row(
                children: [
                  SizedBox(
                    width: 24, // Adjust width to match checkbox size
                    height: 24, // Adjust height to match checkbox size
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(98, 79, 187, 1),
                            Color.fromRGBO(32, 15, 59, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners similar to DetailBookingPage
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.transparent, // Transparent for consistency
                        ),
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          checkColor: Colors.deepPurple, // Checkmark color
                          activeColor: Colors.transparent, // Transparent so the gradient shows
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Makes the checkbox smaller
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Remember me',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(), // Properly closes the row structure
                  GestureDetector(
                    onTap: () {
                      // Navigate to Login page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()), // Navigates to the Login page
                      );
                    },
                    child: const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline, // Make it more obvious it's clickable
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Spacing before the register button

              // Register Button
              Center(
                child: Container(
                  width: double.infinity, // Make button take full width
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
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent, // Transparent to show gradient
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to HomePage when button is pressed
                    Navigator.pushReplacement(
                     context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                             );

                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white, // White text for contrast
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
