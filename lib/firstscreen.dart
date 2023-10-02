// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sam_app/user_auth/firebase_auth_implement/firebase_auth_services.dart';

class FirstScreen extends StatelessWidget {
 
  Widget build(BuildContext context) {
    // Delay navigation to the second screen
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the second screen
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: Color(0xFF927CCF),
      // appBar: AppBar(
      //   title: Text('APNA GHAR'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display your icon here
            Icon(
              Icons.home,
              size: 120.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            SizedBox(height: 0.0),
            // Display your text here
            Text(
              'APNA GHAR',
              style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 209, 209, 209)),
            ),
          ],
        ),
      ),
    );
  }
}
