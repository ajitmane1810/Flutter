import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON decoding
import 'details_screen.dart'; // Import the DetailsScreen

class HomePage extends StatefulWidget {
  final Function onMoreTapped;
  const HomePage({super.key, required this.onMoreTapped});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true; // To show loading indicator
  List<dynamic> shows = []; // List to store shows from API

  // List of image URLs
  final List<String> imageUrls = [
    'assets/movies1.png',
    'assets/movie3.png',
    'assets/movie2.png',
  ];

  @override
  void initState() {
    super.initState();
    fetchShows();
  }

  // Fetch data from the API
  Future<void> fetchShows() async {
    final response =
        await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

    if (response.statusCode == 200) {
      // Parse the JSON data
      List<dynamic> data = json.decode(response.body);

      setState(() {
        shows = data;
        isLoading = false; // Update loading state
      });
    } else {
      // Handle errors if any
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load shows');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: <Widget>[
          _buildAppBar(context),
          _buildCarouselSlider(),
          _buildTrendingMovies(),
          _buildResponsiveListView(context),
        ],
      ),
    );
  }

  // AppBar with search icon
  Widget _buildAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, right: 10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'Movies',
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              widget.onMoreTapped();
            },
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Carousel Slider with 3 network images
  Widget _buildCarouselSlider() {
    return CarouselSlider(
      items: imageUrls.map((url) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          // color: Colors.grey[200], // Optional background color
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Optional rounded corners
            child: Image.asset(
              url,
              fit: BoxFit.cover, 
              // loadingBuilder: (context, child, loadingProgress) {
              //   if (loadingProgress == null) return child;
              //   return Center(
              //     child: CircularProgressIndicator(
              //       value: loadingProgress.expectedTotalBytes != null
              //           ? loadingProgress.cumulativeBytesLoaded /
              //               (loadingProgress.expectedTotalBytes ?? 1)
              //           : null,
              //     ),
              //   );
              // },
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 14 / 8,
      ),
    );
  }

  // Trending movies section (Example data)
  Widget _buildTrendingMovies() {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Trending Movies',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
      ),
    );
  }

  // Responsive ListView Builder with containers
  Widget _buildResponsiveListView(BuildContext context) {
    int itemCount = shows.length;
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth < 600) {
      crossAxisCount = 2; // Mobile
    } else if (screenWidth < 1200) {
      crossAxisCount = 4; // Tablet
    } else {
      crossAxisCount = 6; // Desktop
    }

    // Show loading indicator if still loading
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1 / 1.5),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final show = shows[index]['show']; // Access show data
          return GestureDetector(
            onTap: () {
              // Navigate to the details screen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    show: show,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(
                    show['image'] != null
                        ? show['image']['medium']
                        : 'https://strongsoul.in/cdn/shop/files/143224cac5f17a05310dd50d1883806b.webp?v=1719147915',
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.4),
                    offset: const Offset(0, 1.5),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          show['name'] ?? 'No Title',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 5),
                        // Summary (description)
                        Text(
                          show['summary'] != null
                              ? show['summary'].toString().replaceAll(
                                  RegExp(r'<[^>]*>'), '') // Remove HTML tags
                              : 'No description available',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
