// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable, dead_code
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sam_app/user_auth/firebase_auth_implement/firebase_auth_services.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userEmail = "Guest";

  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  Future<void> _getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email ?? "Guest";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFFECE9F4),
      appBar: AppBar(
        backgroundColor:Color(0xFFECE9F4) ,
        title: Text('Home Screen'),
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, "/homescreen");

        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.donut_large_outlined),
                    
            Text(
              'Currently Logged In As:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              ' $userEmail',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      
    );

    
  }
}
