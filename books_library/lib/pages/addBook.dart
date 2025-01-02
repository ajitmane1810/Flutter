import 'dart:convert';

import 'package:books_library/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:http/http.dart' as http;

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String author = '';
  String imgUrl = '';
  String genre = '';
  int publishYear = 0;

  Future<void> addBook() async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/addBook'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'title': title,
        'author': author,
        'imgUrl': imgUrl,
        'genre': genre,
        'publishYear': publishYear,
      }),
    );

    if (response.statusCode == 200) {
      AnimatedSnackBar.material(
        ' Book $title Add Successfully ',
        type: AnimatedSnackBarType.success,
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
      ).show(context);
      // Clear the fields after successful addition
      setState(() {
        title = '';
        author = '';
        imgUrl = '';
        genre = '';
        publishYear = 0;
      });
      // Reset the form
      _formKey.currentState!.reset();
      debugPrint("Added book successfully");
      // Optionally, show a success message
    } else {
      // Handle error (show an error message, etc.)

      AnimatedSnackBar.material(
        ' Book $title Failed to add book. ',
        type: AnimatedSnackBarType.error,
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
            appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text('Add Books',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: const Color.fromARGB(255, 227, 224, 224))),
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.of(context).size.width * 0.9, // Limit the width
            ),
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, // Make it take full width
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Enter Title',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) => title = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white, // Set the input text color here
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Enter Author',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) => author = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the author';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white, // Set the input text color here
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Enter imgURL',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) => imgUrl = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the author';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white, // Set the input text color here
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Enter Genre',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) => genre = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the genre';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white, // Set the input text color here
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Enter Publish Year',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) =>
                          publishYear = int.tryParse(value) ?? 0,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a publish year';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Bouncing(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addBook();
                          // Handle the book information, e.g., save to a database
                        }
                      },
                      child: Center(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04),
                              constraints: BoxConstraints(
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.22,
                                minHeight: 50,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromARGB(255, 74, 174,
                                    207), // Set the container's background color
                              ),
                              child: const Center(
                                child: Text('ADD BOOK',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                    )),
                              ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
