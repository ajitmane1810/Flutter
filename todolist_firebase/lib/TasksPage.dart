import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_firebase/Tasks.dart';
import 'package:intl/intl.dart';

class TasksPage extends StatelessWidget {
  final String categoryName;
  final String categoryId;
  String collectionName = '';

  TasksPage(
      {required this.categoryId,
      required this.categoryName,
      required this.collectionName});

  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      // setState(() {
      selectedDate = picked;
    _dateController.text = DateFormat('yyyy-MM-dd').format(picked!);
    // Set selected date to text field
    //});
  }

  @override
  Widget build(BuildContext context) {
    // created "Tasks" collection on firestore
    final CollectionReference tasksRef =
        FirebaseFirestore.instance.collection('tasks');

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 180, 206),
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: const Color.fromRGBO(27, 26, 85, 1),
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text(
          collectionName,
          style: GoogleFonts.jost(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: tasksRef.where('categoryId', isEqualTo: categoryId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // converted firestore tasks colection data to our model class
          final List<Task> tasks =
              snapshot.data!.docs.map((doc) => Task.fromSnapshot(doc)).toList();

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Container(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                // padding: EdgeInsets.only(top: 5,bottom: 5),

                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 140,
                        // color: Colors.amber,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(task.title,
                                style: GoogleFonts.jost(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(
                                        147, 149, 211, 1))),
                            Text(
                              DateFormat('dd-MM-yyyy').format(task.date),
                              style: GoogleFonts.jost(
                                  fontSize: 13,
                                  fontWeight: FontWeight
                                      .w400), // Format DateTime as desired
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //  color: Colors.amber,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Edit Task'),
                                        content: TextField(
                                          controller: _textFieldController,
                                          decoration: InputDecoration(
                                              hintText: task.title),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              _textFieldController.clear();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('SAVE'),
                                            onPressed: () async {
                                              String newCategoryName =
                                                  _textFieldController.text
                                                      .trim();
                                              if (newCategoryName.isNotEmpty) {
                                                await tasksRef
                                                    .doc(task.id)
                                                    .update({
                                                  'title': newCategoryName,
                                                  'timestamp': FieldValue
                                                      .serverTimestamp()
                                                });
                                              }

                                              Navigator.pop(context);
                                              _textFieldController.clear();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                color: const Color.fromRGBO(179, 183, 238, 1),
                                icon: const Icon(Icons.edit_outlined)),
                            IconButton(
                                onPressed: () async {
                                  await tasksRef.doc(task.id).delete();
                                },
                                color: const Color.fromRGBO(179, 183, 238, 1),
                                icon: const Icon(Icons.delete_outline_rounded)),
                            Checkbox(
                              value: task.isCompleted,
                              onChanged: (newValue) async {
                                await tasksRef.doc(task.id).update({
                                  'isCompleted': newValue,
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  // trailing: Checkbox(
                  //   value: task.isCompleted,
                  //   onChanged: (newValue) async {
                  //     await tasksRef.doc(task.id).update({
                  //       'isCompleted': newValue,
                  //     });
                  //   },
                  // ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
        onPressed: () {
          _showBottomSheet(context, tasksRef);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, CollectionReference tasksRef) {
    final TextEditingController _controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            
            padding: EdgeInsets.only(
             top: 40,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 55),
                  child: Text(
                    "Enter Task",
                    style: GoogleFonts.averageSans(
                        fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
                  child: Text(
                    "Enter Date",
                    style: GoogleFonts.averageSans(
                        fontWeight: FontWeight.w400, fontSize: 17),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 55),
                  // padding: EdgeInsets.all(50),
                  child: TextField(
                    controller: _dateController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'\d')) // Only allow digits
                    ],
                    decoration: InputDecoration(
                        // labelText: '(DD/MM/YYYY)',
                        filled: true,
                        fillColor: const Color.fromRGBO(208, 205, 236, 1),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: const Icon(Icons.calendar_today_outlined))),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () async {
                        String taskTitle = _controller.text.trim();
                        String taskDate = _dateController.text.trim();
                        if (taskTitle.isNotEmpty && taskDate.isNotEmpty) {
                          await tasksRef.add({
                            'categoryId': categoryId,
                            'categoryName': categoryName,
                            'title': taskTitle,
                            'date': Timestamp.fromDate(DateTime.parse(taskDate)),
                            'isCompleted': false,
                            'timestamp': FieldValue
                                .serverTimestamp(), // Add the timestamp field
                          });
          
                          _controller.clear();
                          _dateController.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Add",
                        style: GoogleFonts.averageSans(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(208, 205, 236, 1)),
                          fixedSize: MaterialStatePropertyAll(Size(100, 40))),
                    ),
                  ),
                  
                ),SizedBox(height: 20,)
              ],
            ),
          ),
        
        );
      },
    );
  }
}
