import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';
import '../components/gradient_color.dart';
import '../models/user.dart';

class UserProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const UserProfilePage({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.03,
          ),
          child: Column(
            children: [
              _buildProfileHeader(screenSize),
              SizedBox(height: screenSize.height * 0.03),
              _buildUserInfo(screenSize),
              SizedBox(height: screenSize.height * 0.03),
              _buildSettingsSection(context, screenSize),
              SizedBox(height: screenSize.height * 0.03),
              _buildLegalSection(context, screenSize),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Header
  Widget _buildProfileHeader(Size screenSize) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://www.example.com/path/to/your/image.jpg'), // Replace with the user's image URL
        ),
        SizedBox(height: screenSize.height * 0.02),
        Text(
          name, // Display the passed username
          style: TextStyle(
            color: Colors.white,
            fontSize: screenSize.width * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // User Info Section
  Widget _buildUserInfo(Size screenSize) {
    return Container(
      padding: EdgeInsets.all(screenSize.width * 0.04),
      decoration: BoxDecoration(
        gradient: GradientColor.getGradient(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          _buildInfoRow('Email:', email, screenSize), // Display passed email
          _buildInfoRow('Phone:', phone, screenSize), // Display passed phone
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String info, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          Text(info, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

// Settings Section
Widget _buildSettingsSection(BuildContext context, Size screenSize) {
  return Container(
    padding: EdgeInsets.all(screenSize.width * 0.04),
    decoration: BoxDecoration(
      gradient: GradientColor.getGradient(),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: const Offset(0, 0),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenSize.width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        ListTile(
          leading: const Icon(Icons.edit, color: Colors.white),
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white70),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Edit Profile clicked!')),
            );
          },
        ),
        const Divider(color: Colors.white54), // Divider between items
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.white),
          title: const Text(
            'App Settings',
            style: TextStyle(color: Colors.white70),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings tapped!')),
            );
          },
        ),
        const Divider(color: Colors.white54),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.white),
          title: const Text(
            'Logout',
            style: TextStyle(color: Colors.white70),
          ),
          onTap: () {
            // Implement logout functionality
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logged out')),
            );
          },
        ),
      ],
    ),
  );
}

// Legal Section
Widget _buildLegalSection(BuildContext context, Size screenSize) {
  return Container(
    padding: EdgeInsets.all(screenSize.width * 0.04),
    decoration: BoxDecoration(
      gradient: GradientColor.getGradient(),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: const Offset(0, 0),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Legal',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenSize.width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        ListTile(
          leading: const Icon(Icons.info_outline, color: Colors.white),
          title: const Text(
            'Terms of Service',
            style: TextStyle(color: Colors.white70),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Terms of Service tapped!')),
            );
          },
        ),
        const Divider(color: Colors.white54),
        ListTile(
          leading: const Icon(Icons.privacy_tip_outlined, color: Colors.white),
          title: const Text(
            'Privacy Policy',
            style: TextStyle(color: Colors.white70),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Privacy Policy tapped!')),
            );
          },
        ),
      ],
    ),
  );
}

}
