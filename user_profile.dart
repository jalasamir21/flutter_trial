import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const UserProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
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
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05, // 5% of screen width
              vertical: screenSize.height * 0.03,  // 3% of screen height
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
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenSize.width * 0.06, // Font size relative to screen width
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // User Info Section with gradient outline
  Widget _buildUserInfo(Size screenSize) {
    return Container(
      padding: EdgeInsets.all(screenSize.width * 0.04),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(124, 68, 229, 1),
            Color.fromRGBO(86, 51, 178, 70),
          ],
        ),
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
          _buildInfoRow('Email:', email, screenSize),
          _buildInfoRow('Phone:', phone, screenSize),
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

  // Settings Section with gradient outline
  Widget _buildSettingsSection(BuildContext context, Size screenSize) {
    return Container(
      padding: EdgeInsets.all(screenSize.width * 0.04),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(124, 68, 229, 1),
            Color.fromRGBO(86, 51, 178, 70),
          ],
        ),
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
              // Handle edit profile action
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
              // Handle settings tap
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings tapped!')),
              );
            },
          ),
        ],
      ),
    );
  }

  // Legal Section with gradient outline
  Widget _buildLegalSection(BuildContext context, Size screenSize) {
    return Container(
      padding: EdgeInsets.all(screenSize.width * 0.04),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(124, 68, 229, 1),
            Color.fromRGBO(86, 51, 178, 70),
          ],
        ),
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
            'Derleng Legal',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          ListTile(
            leading: const Icon(Icons.article, color: Colors.white),
            title: const Text(
              'Terms and Conditions',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              // Handle terms and conditions tap
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Terms and Conditions tapped!')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.white),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              // Handle privacy policy tap
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
