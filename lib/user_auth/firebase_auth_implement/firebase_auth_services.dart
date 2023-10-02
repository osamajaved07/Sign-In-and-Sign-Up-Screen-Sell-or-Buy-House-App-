// ignore_for_file: camel_case_types, prefer_final_fields, unused_field, prefer_const_constructors, sort_child_properties_last, avoid_print, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class firebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPassword(String email ,String password) async{

    try{
      UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;

    } catch (e) {
      print('Some error Ocurred');

    }
    return null;



  }
    Future<User?> signInWithEmailandPassword(String email ,String password) async{

    try{
      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;

    } catch (e) {
      print('Some error Ocurred');

    }
    return null;



  }


  



}

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
      var _passwordVisible = false;
      
  @override
  Widget build(BuildContext context) {
    String password;
    String email;
   // var _passwordVisible = false;
    return Scaffold(
      appBar:AppBar(title: Text("Login Page"), backgroundColor: Colors.green,),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipOval(
              child: Image.asset("assets/images/logo.png",width: 200,height: 200,)
              ),

            Text("WELCOME TO LOGIN PAGE", style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold,color: Colors.green ),),

            Text("Enter your details below", style: TextStyle(fontSize: 15, color: Color(0xFF237724))),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Enter your Email",
                  labelText: "Email",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.email)),
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email must not be empty';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
                      },
                      onChanged: (value) => email = value,
                      ),
            ),



            SizedBox(height: 25,),



            Padding(
              padding: const EdgeInsets.only(right: 12, left: 12),
              child: TextFormField(
              keyboardType: TextInputType.text,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                  hintText: "Enter your Password",
                  labelText: "Password",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    child: Icon(
                      _passwordVisible
                      ? Icons.visibility: Icons.visibility_off,
                    ),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password must not be empty';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                } else if (!RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value)) {
                  return 'Password must contain at least one uppercase, one lowercase, one digit, and one special character';
                }
                return null;
              },
              onChanged: (value) => password = value,
                      ),
                     
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25, top: 10),
                  child: ElevatedButton(onPressed: (){}, child: Text("LOGIN", style: TextStyle(fontSize: 16),), 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: StadiumBorder())),
                )
                ]
                )
            

          ],
        ),
      ),
      
    );
  }
}