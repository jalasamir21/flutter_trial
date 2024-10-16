import 'package:flutter/material.dart';
import 'package:trial/components/input_box.dart';
import 'home_page.dart';
import 'register.dart'; // Import the HomePage

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

              // Login text
              const Text(
                'Sign in here',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 20), // Adds spacing between title and image

              // Location image at the top
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
                  InputBox('Password', Icons.lock),
                ],
              ),
              const SizedBox(height: 20), // Adds spacing before the checkbox

              // Remember me checkbox (similar to the Register screen)
              Row(
                children: [
                  // Checkbox widget (you can customize it similarly to the register page)
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: false, // Set to false or manage state as needed
                      onChanged: (value) {
                        // Handle checkbox change
                      },
                      checkColor: Colors.deepPurple, // Checkmark color
                      activeColor: Colors.transparent, // Keep it transparent
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Remember me',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Register page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline, // Make it more obvious it's clickable
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Spacing before the login button

              // Login Button
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
                      'Sign in',
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
