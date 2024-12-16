import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_firebase/TasksPage.dart';
import 'package:todolist_firebase/category.dart';

class CategoryPage extends StatelessWidget {
  String? username;
  CategoryPage({super.key, required this.username});
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // created a categories collection on firestore
    final CollectionReference categoriesRef =
        FirebaseFirestore.instance.collection('categories');

    return Scaffold(
      backgroundColor: const Color.fromRGBO(208, 205, 236, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, bottom: 10, top: 80),
            child: Text(
              'Hello',
              style: GoogleFonts.asapCondensed(
                  fontSize: 40, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, bottom: 50),
            child: Text(
              "$username",
              style: GoogleFonts.asapCondensed(
                  fontSize: 40, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  // top: 40,
                  ),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(13, 12, 56, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: StreamBuilder<QuerySnapshot>(
                stream: categoriesRef.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // coverted firestore data(documetapshot data) ito our model class Category
                  final List<Category> categories = snapshot.data!.docs
                      .map((doc) => Category.fromSnapshot(doc))
                      .toList();

                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Container(
                      
                        height: 60,
                        margin: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(category.name,
                                      style: GoogleFonts.jost(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            179, 183, 238, 1),
                                      )),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Edit Category',
                                                    style:
                                                        GoogleFonts.averageSans(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  ),
                                                  content: TextField(
                                                    controller:
                                                        _textFieldController,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            category.name),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child:
                                                          const Text('CANCEL'),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        _textFieldController
                                                            .clear();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: const Text('SAVE'),
                                                      onPressed: () async {
                                                        String newCategoryName =
                                                            _textFieldController
                                                                .text
                                                                .trim();
                                                        if (newCategoryName
                                                            .isNotEmpty) {
                                                          await categoriesRef
                                                              .doc(category.id)
                                                              .update({
                                                            'name':
                                                                newCategoryName,
                                                            'timestamp': FieldValue
                                                                .serverTimestamp()
                                                          });
                                                        }

                                                        Navigator.pop(context);
                                                        _textFieldController
                                                            .clear();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          color: const Color.fromRGBO(
                                              179, 183, 238, 1),
                                          icon:
                                              const Icon(Icons.edit_outlined)),
                                      IconButton(
                                          onPressed: () async {
                                            await categoriesRef
                                                .doc(category.id)
                                                .delete();
                                          },
                                          color: const Color.fromRGBO(
                                              179, 183, 238, 1),
                                          icon: const Icon(
                                              Icons.delete_outline_rounded))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TasksPage(
                                    categoryId: category.id,
                                    categoryName: category.name,
                                    collectionName: category.name),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
        onPressed: () {
          _showBottomSheet(context, categoriesRef);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet(
      BuildContext context, CollectionReference categoriesRef) {
    final TextEditingController _controller = TextEditingController();

    showModalBottomSheet(
      
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            // margin: EdgeInsets.only(bottom: 40),
            padding: EdgeInsets.only(
              top: 40,
              bottom: MediaQuery.of(context).viewInsets.bottom),
            // height: 450,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 0, left: 55, bottom: 10),
                    child: Text(
                      'Enter Category',
                      style: GoogleFonts.averageSans(
                          fontSize: 17, fontWeight: FontWeight.w400),
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 55),
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(208, 205, 236, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none)),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  height: 40,
                  width: 90,
                  margin: EdgeInsets.only(
                      top: 20, left: MediaQuery.of(context).size.width / 2.8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(70, 40)),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(208, 205, 236, 1),
                          )),
                      onPressed: () async {
                        String categoryName = _controller.text.trim();
                        if (categoryName.isNotEmpty) {
                          await categoriesRef.add({
                            'name': categoryName,
                            'timestamp': FieldValue
                                .serverTimestamp(), // Add the timestamp field
                          });
          
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Add',
                        style: GoogleFonts.averageSans(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )),
                    
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        );
      },
    );
  }
}
