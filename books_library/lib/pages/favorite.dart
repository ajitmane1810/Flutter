import 'package:books_library/widgets/global_favorites.dart'; // Import the global favorite list
import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart'; // Import AnimatedSnackBar

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  // Function to remove the book from favorites
  void removeFromFavorites(BuildContext context, int index) {
    // Remove the book from the global favorites list
    var removedBook = favoriteBooks[index];  // Optionally save the removed book for any other purpose

    favoriteBooks.removeAt(index);

    // Show an animated success message with AnimatedSnackBar
    AnimatedSnackBar.material(
      'Removed from Favorites!',
      duration: const Duration(seconds: 2),
      type: AnimatedSnackBarType.success,
    ).show(context); // Display the animated snack bar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Favorites',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: favoriteBooks.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                var book = favoriteBooks[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  color: Colors.transparent,
                  child: ListTile(
                    leading: Image.network(
                      book['imgUrl'],
                      width: 50,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      book['title'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      book['author'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () => {
                        removeFromFavorites(context, index),
                        setState(() {
                          
                        })
                      }
                    
                    ),
                  ),
                );
              },
            ),
    );
  }
}
