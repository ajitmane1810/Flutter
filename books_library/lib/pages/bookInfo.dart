import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:books_library/widgets/bgImage.dart';
import 'package:books_library/widgets/global_favorites.dart';
import 'package:flutter/material.dart';

class BookInfoPage extends StatefulWidget {
  final Map<String, dynamic> book;

  const BookInfoPage({super.key, required this.book});

  @override
  State<BookInfoPage> createState() => _BookInfoPageState();
}

class _BookInfoPageState extends State<BookInfoPage> {
  bool isFavorited = false; 

  // Function to handle the favorite action
  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      if (isFavorited) {
        // Add the book to the favorites list
        favoriteBooks.add(widget.book);
      } else {
        // Remove the book from the favorites list
        favoriteBooks.remove(widget.book);
      }
    });

    // Show a snack bar to indicate whether the item is added to favorites or not
    AnimatedSnackBar.material(
      isFavorited ? 'Added to Favorites!' : 'Removed from Favorites!',
      type: isFavorited ? AnimatedSnackBarType.success : AnimatedSnackBarType.error,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BackgroundImage(
      body: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          widget.book['title'],
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: screenWidth > 600 ? screenHeight * 3.9 : screenHeight * 0.6,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(widget.book['imgUrl']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: toggleFavorite,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: isFavorited ? Colors.red : Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title : ${widget.book['title']}',
                      style: const TextStyle(fontSize: 18, letterSpacing: 1, color: Colors.white)),
                  Text('Author : ${widget.book['author']}',
                      style: const TextStyle(fontSize: 18, letterSpacing: 1, color: Colors.white)),
                  Text('Genre : ${widget.book['genre']}',
                      style: const TextStyle(fontSize: 18, letterSpacing: 1, color: Colors.white)),
                  Text('Publish Year : ${widget.book['publishYear']}',
                      style: const TextStyle(fontSize: 18, letterSpacing: 1, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Description: \n(Here you can add a description or any other details about the book)',
                style: TextStyle(fontSize: 16, color: Colors.white, letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
    ),
      imagePath: 'images/CarouselSlider.png',
    );
  }
}
