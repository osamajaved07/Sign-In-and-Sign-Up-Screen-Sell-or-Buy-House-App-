// ignore_for_file: unused_local_variable, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously, avoid_web_libraries_in_flutter, unused_import, sort_child_properties_last, prefer_final_fields, unused_field, unused_element, dead_code

//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:my_app/homescreen.dart';
import 'package:sam_app/homescreen.dart';

// import 'package:my_app/signup.dart';
import 'package:sam_app/signup.dart';
// import 'package:my_app/user_auth/firebase_auth_implement/firebase_auth_services.dart';
import 'package:sam_app/user_auth/firebase_auth_implement/firebase_auth_services.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final firebaseAuthServices _auth = firebaseAuthServices(); 
  bool isPasswordVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
   
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController(); 

  signInWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text);
        } 
        on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {return ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("No user found for that email."),
                  )
                  );} 
            
            else if (e.code == 'wrong-password') {
              return ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Wrong password provided for that user."),
                  )
                  );}
                  }}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFECE9F4),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left:20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: Image.asset("assets/images/im.png", width: 300,height: 300,),
                ),
                _header(context),
                SizedBox(height: 15),
                _inputField(context),
                _logButton(context),
                _forgotpassword(context),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "WELCOME TO APNA GHAR",
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFF927CCF),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Enter your details below",
          style: TextStyle(
              color:  Color(0xFF6F5F9A),
              fontSize: 15,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  _inputField(context) {
    String password;
    String email;
    
    return Form( 
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
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
          SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
                hintText: "Enter your Password",
                labelText: "Password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible; // Toggle visibility
                });
              },
            ),
          ),
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
          SizedBox(height: 10),
          

          
         
          
          
          // ElevatedButton(
          //   onPressed: () {
          //     if (_formKey.currentState!.validate()) {
          //       // Perform login here
          //     }
          //   },
          //   child: Text("Login"),
          //   style: ElevatedButton.styleFrom(
          //     shape: StadiumBorder(),
          //     padding: EdgeInsets.symmetric(vertical: 16),
          //   ),
          // ),
        ],
      ),
    );
  }

  _logButton(context){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: _signIn
                    ,
                      child: Text("Sign In",style: TextStyle(fontSize: 17, color: Color(0xFFFFFFFF)),),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Color(0xFF927CCF), padding: EdgeInsets.symmetric(vertical: 16),),),
              ],
            );}  

  _forgotpassword(context) {
    return TextButton(onPressed: () {}, child: Text("Forgot password?",style: TextStyle(fontSize: 15,color: Color(0xFF927CCF))));
  }

_signup(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("   Don't have an account?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,)),
      SizedBox(width: 10,),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen()), 
          );
        },
        
        child: Text("Sign Up",style: TextStyle(fontSize: 16,color: Color(0xFF927CCF))),
      ),
    ],
  );
}
  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;


    User? user = await _auth.signInWithEmailandPassword(email, password);
    if (user != null){
      print('User is Successfully SignedIn');
      Navigator.pushNamed(context, "/homescreen");


    }
    else{
      print('Some error happened');
    }
  }

}
