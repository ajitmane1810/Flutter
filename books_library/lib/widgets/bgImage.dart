import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final Widget body;
   final String imagePath;

  BackgroundImage({required this.body, required this.imagePath,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image with reduced opacity
          Opacity(
            opacity: 0.5,
            child: Container(
              height: double.infinity,
              decoration:  BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(imagePath), // Your image path
                  fit: BoxFit.none
                ),
              ),
            ),
          ),
          // Foreground content
          Container(
            child: body,
          ),
        ],
      ),
    );
  }
}
