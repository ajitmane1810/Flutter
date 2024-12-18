import 'package:ecommerce_app/screens/homepage.dart';
import 'package:ecommerce_app/screens/profilepage.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  final List pages = [
    const HomePage(),
    const Scaffold(),
    const Scaffold(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            
          });
          selectedIndex = value;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined,),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.notification_add_outlined,),label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline,),label: "Profile"),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
