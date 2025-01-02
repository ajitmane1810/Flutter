import 'package:books_library/pages/bookInfo.dart';
import 'package:books_library/services/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Function onMoreTapped;

  const HomePage({super.key, required this.onMoreTapped});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> books = [];
  final BookService _bookService = BookService();

  Future<void> fetchBooks() async {
    try {
      final fetchedBooks = await _bookService.fetchBooks();
      setState(() {
        books = fetchedBooks;
      });
    } catch (e) {
      debugPrint(e.toString()); // Handle errors
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Determine the scroll physics based on screen size
    final scrollPhysics = screenWidth > 600
        ? AlwaysScrollableScrollPhysics() // Scrollable on larger screens
        : NeverScrollableScrollPhysics(); // Not scrollable on smaller screens

    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: Drawer(),
      body: ListView(
        physics: scrollPhysics,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                const Text(
                  'BookLand',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                        'images/social.png'), // Update with your image path
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose a book according\nto your mood',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Container(
                  height: screenWidth * 0.4,

                  // color: Colors.amber,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 containers in a row
                      childAspectRatio:
                          2.5, // Adjust to get the desired height-to-width ratio
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Book ${index + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 0),
                const Text(
                  'We Recommended',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(height: 15),
                Container(
                  height: screenWidth *
                      0.8, // Adjust height to accommodate two rows

//  color: Colors.amber,
                  child: GridView.count(
                    crossAxisCount: 3, // 3 items in the first row
                    childAspectRatio: 0.75,
                    physics: scrollPhysics,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    children: List.generate(
                      books.length > 5
                          ? 6
                          : books.length, //  Show "More" if more than 6 ,
                      //  6,
                      (index) {
                        if (index < 5) {
                          return GestureDetector(
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BookInfoPage(book: books[index]),
                                ),
                              );
                              if (result == true) {
                                fetchBooks(); // Refresh the list of books
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(color: Colors.grey),
                                image: DecorationImage(
                                  image: NetworkImage(books[index]['imgUrl']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10),
                                  bottom: Radius.circular(10),
                                ),
                              ),
                            ),
                          );
                        } else {
                          // "More" Container
                          return GestureDetector(
                            onTap: () {
                              widget
                                  .onMoreTapped(); // Call the callback to change the index
                              debugPrint('More books tapped');
                            },
                            child: Container(
                              width: screenWidth * 0.35, // Responsive width
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10),
                                  bottom: Radius.circular(10),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'More',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//  Container(

//           height: screenWidth * 0.5, // Responsive height based on screen width
//           width: screenWidth,
//           margin: const EdgeInsets.only(top: 14, left: 15, right: 15),
//            child: CarouselSlider(
//             options: CarouselOptions(
//               autoPlay: true,
//               enlargeCenterPage: true,
//               aspectRatio: 2.0,
//             ),
//             items: [
//               'images/CarouselSlider1.png',
//               'images/CarouselSlider2.png',
//               'images/CarouselSlider3.png',

//             ].map((item) => Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: AssetImage(item),

//                 ),
//               ),
//             )).toList(),
//            ),
//         ),
