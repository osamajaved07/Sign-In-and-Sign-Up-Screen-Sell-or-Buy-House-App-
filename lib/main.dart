// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:sam_app/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sam_app/login.dart';
import 'package:sam_app/firstscreen.dart';
import 'package:sam_app/show_email.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      '/homescreen': (context) => homescreen(),
      '/showemail': (context) => HomeScreen(),
      '/login': (context) => LoginPage(),},
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: FirstScreen(),
    );
  }
}

