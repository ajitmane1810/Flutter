import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:books_library/services/services.dart';
import 'package:books_library/widgets/bgImage.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatefulWidget {
  final Map<String, dynamic> book;

  const BookDetailsPage({super.key, required this.book});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  final BookService _bookService = BookService(); // Instance of BookService

  Future<void> editBook(int id, Map<String, dynamic> bookDetails) async {
    try {
      await _bookService.editBook(id, bookDetails);
      // Update the local book data and refresh the UI
      setState(() {
        widget.book['title'] = bookDetails['title'];
        widget.book['author'] = bookDetails['author'];
        widget.book['imgUrl'] = bookDetails['imgUrl'];
        widget.book['genre'] = bookDetails['genre'];
        widget.book['publishYear'] = bookDetails['publishYear'];
      });
      AnimatedSnackBar.material(
        ' Book ${widget.book['title']} Edit Successfully ',
        type: AnimatedSnackBarType.info,
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
      ).show(context);
      // debugPrint("Book edited successfully.");
    } catch (e) {
      debugPrint("Error editing book: $e");
    }
  }

  Future<void> deleteBook(int id) async {
    try {
      await _bookService.deleteBook(id);
      // Navigate back or show a success message
      AnimatedSnackBar.material(
        ' Book ${widget.book['title']} Delete Successfully ',
        type: AnimatedSnackBarType.success,
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
      ).show(context);
      // debugPrint("Book deleted successfully.");
      Navigator.pop(context, true);
    } catch (e) {
      debugPrint("Error deleting book: $e");
    }
  }

  void showEditDialog(int id, String currentTitle, String currentAuthor,
      String currentImgUrl, String currentGenre, int currentPublishYear) {
    final titleController = TextEditingController(text: currentTitle);
    final authorController = TextEditingController(text: currentAuthor);
    final imgUrlController = TextEditingController(text: currentImgUrl);
    final genreController = TextEditingController(text: currentGenre);
    final publishYearController =
        TextEditingController(text: currentPublishYear.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Book'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title')),
              TextField(
                  controller: authorController,
                  decoration: const InputDecoration(labelText: 'Author')),
              TextField(
                  controller: imgUrlController,
                  decoration: const InputDecoration(labelText: 'Image URL')),
              TextField(
                  controller: genreController,
                  decoration: const InputDecoration(labelText: 'Genre')),
              TextField(
                  controller: publishYearController,
                  decoration: const InputDecoration(labelText: 'Publish Year'),
                  keyboardType: TextInputType.number),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final updatedBook = {
                  'title': titleController.text,
                  'author': authorController.text,
                  'imgUrl': imgUrlController.text,
                  'genre': genreController.text,
                  'publishYear': int.tryParse(publishYearController.text) ?? 0,
                };
                editBook(
                    widget.book['id'], updatedBook); // Pass the ID of the book
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      body: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
           leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
          title: Text(widget.book['title'],
           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      showEditDialog(
                        widget.book['id'],
                        widget.book['title'],
                        widget.book['author'],
                        widget.book['imgUrl'],
                        widget.book['genre'],
                        widget.book['publishYear'],
                      );
                    },
                    icon: const Icon(Icons.edit_rounded,color: Colors.white,),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 280,
                    width: 200,
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
                  IconButton(
                    onPressed: () {
                      deleteBook(widget.book['id']); // Call the delete method
                    },
                    icon: const Icon(Icons.delete_forever_rounded,color: Colors.white,),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title : ${widget.book['title']}',
                      style: const TextStyle(fontSize: 18, letterSpacing: 1,color: Colors.white)),
                  Text('Author : ${widget.book['author']}',
                      style: const TextStyle(fontSize: 18, letterSpacing: 1,color: Colors.white)),
                  Text('Genre : ${widget.book['genre']}',
                      style: const TextStyle(fontSize: 18, letterSpacing: 1,color: Colors.white)),
                  Text('Publish Year : ${widget.book['publishYear']}',
                      style: const TextStyle(fontSize: 18, letterSpacing: 1,color: Colors.white)),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Description: \n(Here you can add a description or any other details about the book)',
                style: TextStyle(fontSize: 16,color: Colors.white, letterSpacing: 1),
              ),
            ],
          ),
        ),
      ), 
      imagePath: 'images/CarouselSlider.png',
    );
  }
}
