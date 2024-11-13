import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final dynamic show;

  const DetailsScreen({super.key, required this.show});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late ImageProvider _imageProvider;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Set image provider to start loading
    _imageProvider = NetworkImage(
      widget.show['image'] != null
          ? widget.show['image']['original']
          : 'https://strongsoul.in/cdn/shop/files/143224cac5f17a05310dd50d1883806b.webp?v=1719147915',
    );

    // Preload the image to track its loading state
    _imageProvider.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener(
            (ImageInfo image, bool synchronousCall) {
              setState(() {
                _isLoading = false; // Image loaded successfully
              });
            },
            onError: (exception, stackTrace) {
              setState(() {
                _isLoading = false; // Error occurred, stop loading
              });
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1200;
    bool isDesktop = screenWidth >= 1200;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.show['name'] ?? 'Movie Details',
          style: const TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 50, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image of the Show
              Center(
                child: Container(
                  width: double.infinity,
                  height: isMobile ? 300 : (isTablet ? 350 : 400),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _imageProvider,
                      fit: BoxFit.contain,
                      onError: (exception, stackTrace) {
                        // Handle image loading error here (optional)
                      },
                    ),
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ) // Show loading indicator while the image is loading
                      : Container(), // Image is loaded, remove the loading indicator
                ),
              ),
              const SizedBox(height: 20),

              // Show Title
              Text(
                widget.show['name'] ?? 'No Title',
                style: TextStyle(
                  fontSize: isMobile ? 24 : (isTablet ? 28 : 32),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Show Summary/Description
              Text(
                widget.show['summary'] != null
                    ? widget.show['summary']
                        .toString()
                        .replaceAll(RegExp(r'<[^>]*>'), '') // Remove HTML tags
                    : 'No description available',
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.white70,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Show Genres
              Text(
                'Genres: ' +
                    (widget.show['genres'] != null
                        ? widget.show['genres'].join(', ')
                        : 'Not available'),
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),

              // Show Language
              Text(
                'Language: ' + (widget.show['language'] ?? 'Not available'),
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),

              // Show Status (Running/Ended)
              Text(
                'Status: ' + (widget.show['status'] ?? 'Not available'),
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),

              // Show Premiere Date
              Text(
                'Premiered: ' + (widget.show['premiered'] ?? 'Not available'),
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),

              // Show Runtime
              Text(
                'Runtime: ${widget.show['runtime'] != null ? '${widget.show['runtime']} minutes' : 'Not available'}',
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),

              // Show Rating
              Text(
                'Rating: ${widget.show['rating']['average'] != null ? widget.show['rating']['average'].toString() : 'Not available'}',
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),

              // Show Network Name
              Text(
                'Network: ' +
                    (widget.show['network'] != null
                        ? widget.show['network']['name']
                        : 'Not available'),
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),

              // Show Schedule (Time and Days)
              Text(
                'Schedule: ${widget.show['schedule'] != null ? '${widget.show['schedule']['time']} on ${widget.show['schedule']['days'].join(', ')}' : 'Not available'}',
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
