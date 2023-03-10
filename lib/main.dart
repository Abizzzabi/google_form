import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form/home_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
 apiKey: "AIzaSyDI2xyP-s9YHBJ48kENZMlLuA8tqYJ09MM",
  authDomain: "myfluttercollege-8e080.firebaseapp.com",
  projectId: "myfluttercollege-8e080",
  storageBucket: "myfluttercollege-8e080.appspot.com",
  messagingSenderId: "667784792376",
  appId: "1:667784792376:web:71de4b5f66dab15b8f99cd",
  measurementId: "G-WLYE0DKTZT"   ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

