import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
      // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
     
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset('image/bg1.png',fit: BoxFit.cover,
           width: screenSize.width,  // Use screen width
            height: screenSize.height, // Use screen height
          ),
          SafeArea(child: child!)
        ],
      ),
    );
  }
}