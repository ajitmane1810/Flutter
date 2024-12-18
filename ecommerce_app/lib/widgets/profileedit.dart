
import 'package:flutter/material.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            const Center(
              child: CircleAvatar(
                radius: 80, // Size of the profile picture
                backgroundImage: AssetImage('assets/profile-avatar.png'), 
              ),
            ),
            const SizedBox(height: 16), 

            // Name
            const Text(
              'Ajit Mane', 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Bio
            const Text(
              'A passionate developer who loves coding and building amazing apps.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16), // Spacer

            // Other Profile Sections (Optional)
            ElevatedButton(
              onPressed: () {
                // Handle edit profile action
              },
              child: const Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}