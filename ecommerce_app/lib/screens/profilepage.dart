import 'package:ecommerce_app/models/list.dart';
import 'package:ecommerce_app/utlis/colors.dart';
import 'package:ecommerce_app/widgets/profileedit.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bannerColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account Title with horizontal padding
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0), // Horizontal padding
                child: Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Profile Info Row with horizontal padding
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), 
                child: Row(
                  children: [
                    // Profile Image
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          'assets/profile-avatar.png'),
                    ),
                    const SizedBox(width: 16),

                    // User info
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ajit Mane',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ajit.mane@example.com',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 79, 79, 79)),
                        ),
                      ],
                    ),

                    // Edit Icon
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit_square,
                          color: Color.fromARGB(255, 63, 64, 65)),
                      onPressed: () {
                        // Handle edit profile
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileEdit(),
                            ));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Account Settings Container with Scroll
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 8)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Account Settings Text
                    const Text(
                      'Account Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Dynamically created List of Account Settings
                    for (int i = 0; i < accountSettings.length; i++)
                      ListTile(
                        leading: Icon(
                          accountSettings[i]["icon"], // Dynamic Icon
                          color: Colors.blue,
                          size: 30,
                        ),
                        title: Text(
                          accountSettings[i]["title"],
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ), // Dynamic Title
                        subtitle: Text(accountSettings[i]["subtitle"],
                            style: const TextStyle(
                                color: Colors.grey)), // Dynamic Subtitle
                        onTap: accountSettings[i]
                            ["onTap"], // Dynamic navigation
                      ),

                    // Log Out Button
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(
                        Icons.logout_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                      title: const Text(
                        "Logout",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      subtitle: const Text("Logout the account.",
                          style: TextStyle(color: Colors.grey)),
                      onTap: () {}, 
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
