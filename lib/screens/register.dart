import 'package:flutter/material.dart';
import 'package:trial/Screens/user_profile.dart';
import '../components/input_box.dart';
import '../components/gradient_color.dart'; // Import the GradientColor class

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false; // Checkbox state (if required for terms & conditions)
  
  // TextEditingControllers to capture user inputs
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    emailController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: GradientColor.getGradient(),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50), // Spacing at the top
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 20), // Spacing between text and image

              // Image
              Center(
                child: Image.asset(
                  'imgs/location.png', // Ensure this path is correct
                  height: 180,
                  width: 208,
                ),
              ),
              const SizedBox(height: 20),

              // Input fields for user details
              Column(
                children: [
                  InputBox('Email', Icons.email, controller: emailController),
                  const SizedBox(height: 10),
                  InputBox('Username', Icons.person, controller: usernameController),
                  const SizedBox(height: 10),
                  InputBox('Phone', Icons.phone, controller: phoneController),
                  const SizedBox(height: 10),
                  InputBox('Password', Icons.lock, controller: passwordController),
                ],
              ),
              const SizedBox(height: 20),

              // Checkbox (if required for accepting terms)
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    'I agree to the terms & conditions',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Register Button
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: GradientColor.getGradient(),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      if (isChecked) {
                        // Pass user details to UserProfilePage when navigating
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfilePage(
                              name: usernameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please accept the terms & conditions'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
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
