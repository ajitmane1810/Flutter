import 'package:books_library/pages/addBook.dart';
import 'package:books_library/pages/favorite.dart';
import 'package:books_library/pages/home.dart';
import 'package:books_library/pages/search.dart';
import 'package:books_library/widgets/bgImage.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

    final List<String> _backgroundImages = [
    'images/animated1.png', // Image for HomePage
    'images/bg2 (2).png', // Image for SearchPage
    'images/CarouselSlider.png', // Image for fav
    'images/CarouselSlider.png', // Image for AddBook
  ];

  // List of widget options without the HomePage constructor argument
  final List<Widget> _widgetOptions = [
    // Placeholder for HomePage, will be assigned later
    const SizedBox.shrink(), 
    const SearchPage(),
    const Favorite(),
    const AddBook(),
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
    return BackgroundImage(
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 13, right: 13, bottom: 15, top: 2),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_sharp),
                  label: 'Favorite',
                ),
                
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_rounded),
                  label: 'Add',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.white,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      ),
       imagePath: _backgroundImages[_selectedIndex], // Pass the selected image path
    );
  }
}
