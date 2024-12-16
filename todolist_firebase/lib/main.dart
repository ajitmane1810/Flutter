import 'package:firebase_core/firebase_core.dart';
import 'package:todolist_firebase/CategoryPage.dart';
import 'package:flutter/material.dart';
import 'package:todolist_firebase/LoginPage.dart';
import 'package:todolist_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore Example',
      home: LoginPage(),
    );
  }
}





  