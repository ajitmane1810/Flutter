import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String categoryId;
  final String categoryName;
  final String title;
  final bool isCompleted;
  final DateTime date;

  Task({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.title,
    this.isCompleted = false,
    required this.date,
  });

  // factory counstructor takes firestore document and return Task class object

  factory Task.fromSnapshot(DocumentSnapshot snapshot) {
    return Task(
      id: snapshot.id,
      categoryId: snapshot['categoryId'],
      categoryName:snapshot['categoryName'],
      title: snapshot['title'],
      isCompleted: snapshot['isCompleted'] ?? false,
      date: (snapshot['date'] as Timestamp)
          .toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName':categoryName,
      'title': title,
      'isCompleted': isCompleted,
       'date': date,
    };
  }
}