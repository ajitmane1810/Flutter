import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/search_screen.dart';



class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;


  // List of widget options without the HomePage constructor argument
  final List<Widget> _widgetOptions = [
    // Placeholder for HomePage, will be assigned later
    const SizedBox.shrink(), 
    SearchPage(),
  
  ];

  @override
  void initState() {
    super.initState();
    // Initialize HomePage with the callback here
    _widgetOptions[0] = HomePage(onMoreTapped: _onMoreTapped);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onMoreTapped() {
    setState(() {
      _selectedIndex = 1; // Change index to 1 for SearchPage
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      );
  }
}
