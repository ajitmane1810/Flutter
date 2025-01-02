import 'package:shared_preferences/shared_preferences.dart';

List<Map<String, dynamic>> favoriteBooks = [];

// Load favorites from SharedPreferences
Future<void> loadFavorites() async {
  final prefs = await SharedPreferences.getInstance();
  final List<String>? storedFavorites = prefs.getStringList('favorites');
  
  if (storedFavorites != null) {
    favoriteBooks = storedFavorites.map((bookTitle) {
      return {
        'title': bookTitle, 
        'author': 'Unknown',  // Placeholder
        'imgUrl': '',         // Placeholder
      };
    }).toList();
  }
}

// Add a book to favorites in SharedPreferences
Future<void> addToFavorites(Map<String, dynamic> book) async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> storedFavorites = prefs.getStringList('favorites') ?? [];
  
  if (!storedFavorites.contains(book['title'])) {
    storedFavorites.add(book['title']);
    await prefs.setStringList('favorites', storedFavorites);
    favoriteBooks.add(book); // Update the local list
  }
}

// Remove a book from favorites in SharedPreferences
Future<void> removeFromFavorites(Map<String, dynamic> book) async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> storedFavorites = prefs.getStringList('favorites') ?? [];

  if (storedFavorites.contains(book['title'])) {
    storedFavorites.remove(book['title']);
    await prefs.setStringList('favorites', storedFavorites);
    favoriteBooks.remove(book); // Update the local list
  }
}
