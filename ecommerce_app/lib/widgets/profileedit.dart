import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // Controllers for each input field
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController userIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  bool isChanged = false; // To track changes

  // Function to show the edit dialog for each field
  Future<void> _showEditDialog(BuildContext context, String title, TextEditingController controller, {bool updateName = false}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // Allow tapping outside to dismiss the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            onChanged: (_) => setState(() {
              isChanged = true; // Mark as changed when editing
              if (updateName && title == "Username") {
                // If editing the username, update the name in the nameController
                nameController.text = controller.text;
              }
            }),
            decoration: InputDecoration(
              hintText: 'Enter new $title',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog without saving
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isChanged = true;
                });
                Navigator.pop(context); // Close dialog after saving
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Function to show a popup for editing the Profile Information or Personal Information section
  Future<void> _showSectionEditDialog(BuildContext context, String section) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // Allow tapping outside to dismiss the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $section Information'),
          content: Column(
            children: <Widget>[
              // Profile Information Fields
              if (section == "Profile") ...[
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(hintText: 'Enter new Username'),
                ),
                TextField(
                  controller: bioController,
                  decoration: const InputDecoration(hintText: 'Enter new Bio'),
                ),
              ],
              // Personal Information Fields
              if (section == "Personal") ...[
                TextField(
                  controller: userIDController,
                  decoration: const InputDecoration(hintText: 'Enter new UserID'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Enter new Email'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(hintText: 'Enter new Phone Number'),
                ),
                TextField(
                  controller: genderController,
                  decoration: const InputDecoration(hintText: 'Enter new Gender'),
                ),
                TextField(
                  controller: dobController,
                  decoration: const InputDecoration(hintText: 'Enter new Date of Birth'),
                ),
              ],
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog without saving
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isChanged = true;
                });
                Navigator.pop(context); // Close dialog after saving
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            const Center(
              child: CircleAvatar(
                radius: 80, // Size of the profile picture
                backgroundImage: AssetImage('assets/profile-avatar.png'), // Replace with your image asset
              ),
            ),
            const SizedBox(height: 16),

            // Name Section (centered horizontally)
            Center( // Center the name horizontally
              child: GestureDetector(
                onTap: () {
                  // Show dialog to edit name when tapped
                  _showEditDialog(context, 'Name', nameController);
                },
                child: Text(
                  // Display the name as the value from nameController or default name if empty
                  usernameController.text.isNotEmpty ? usernameController.text : 'Ajit Mane', 
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Bio Section (non-editable upon tap)
            GestureDetector(
              onTap: () {
                // Do not trigger edit for Bio
              },
              child: Text(
                bioController.text.isNotEmpty
                    ? bioController.text
                    : 'A passionate developer who loves coding and building amazing apps.', // Default bio
                textAlign: TextAlign.center, // Center align the bio
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),

            // Profile Information Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Profile Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showSectionEditDialog(context, 'Profile');
                  },
                  child: const Icon(Icons.arrow_forward), // Edit arrow icon
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Show Profile Info fields here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Username:', style: TextStyle(fontSize: 16)),
                GestureDetector(
                  onTap: () {
                    _showEditDialog(context, 'Username', usernameController, updateName: true);
                  },
                  child: Text(usernameController.text.isNotEmpty ? usernameController.text : 'Username'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Bio:', style: TextStyle(fontSize: 16)),
                Text(bioController.text.isNotEmpty ? bioController.text : 'Your Bio'),
              ],
            ),
            const Divider(),

            // Personal Information Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showSectionEditDialog(context, 'Personal');
                  },
                  child: const Icon(Icons.arrow_forward), // Edit arrow icon
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Show Personal Info fields here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('UserID:', style: TextStyle(fontSize: 16)),
                Text(userIDController.text.isNotEmpty ? userIDController.text : 'UserID'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Email:', style: TextStyle(fontSize: 16)),
                Text(emailController.text.isNotEmpty ? emailController.text : 'Email'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Phone:', style: TextStyle(fontSize: 16)),
                Text(phoneController.text.isNotEmpty ? phoneController.text : 'Phone'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Gender:', style: TextStyle(fontSize: 16)),
                Text(genderController.text.isNotEmpty ? genderController.text : 'Gender'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('DOB:', style: TextStyle(fontSize: 16)),
                Text(dobController.text.isNotEmpty ? dobController.text : 'Date of Birth'),
              ],
            ),
            const Divider(),

            // Save or Go Back Button
            if (isChanged)
              ElevatedButton(
                onPressed: () {
                  // Add save logic here
                  print("Information saved");
                  setState(() {
                    isChanged = false; // Reset change status
                  });
                },
                child: const Text('Save Information'),
              )
            else
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
          ],
        ),
      ),
    );
  }
}
