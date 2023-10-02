// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, deprecated_member_use, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, unused_import, use_build_context_synchronously, avoid_print, depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:my_app/login.dart';
import 'package:sam_app/login.dart';

// import 'package:my_app/user_auth/firebase_auth_implement/firebase_auth_services.dart';
// import 'package:sam_app/user_auth/firebase_auth_implement/firebase_auth_services.dart';
import 'package:sam_app/user_auth/firebase_auth_implement/firebase_auth_services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firebaseAuthServices _auth = firebaseAuthServices();
  bool isPasswordVisible = false; 
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  String password ='';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFECE9F4),
         body: Center(
           child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(right:20, left:20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/signup.png",
                    width: 220,
                    height: 220,
                  ),
                  _header(context),
                  SizedBox(height: 35),
                  _inputField(context),
                  SizedBox(height: 8),
                  _signup(context),
                  _text(context),
                ],
              ),
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
          "SIGN UP FORM",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF927CCF)),
        ),
        Text(
          "Signup here",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6F5F9A)),
        )
      ],
    );
  }

  _inputField(context) {
    String email;
    String name;
    String phone;
    //String password;
    String confirmpassword;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: "  Username",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name must not be empty';
              }
              return null;
            },
            onChanged: (value) => name = value,
          ),
          SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "  Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email must not be empty';
              } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
            onChanged: (value) => email = value,
          ),
          // SizedBox(height: 15),
          // TextFormField(
          //   keyboardType: TextInputType.number,
          //   decoration: InputDecoration(
          //     hintText: "  Phone Number",
          //     border:
          //         OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          //     prefixIcon: Icon(Icons.phone),
          //   ),
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Phone must not be empty';
          //     }
          //     return null;
          //   },
          //   onChanged: (value) => phone = value,
          // ),
          SizedBox(height: 15),
          TextFormField(
            
            keyboardType: TextInputType.visiblePassword,
            controller: _passwordController,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              hintText: "  Enter Password",
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
              }
              return null;
            },
            onChanged: (value) => password = value,
          ),
          SizedBox(height: 15),
          TextFormField(
            obscureText: !isPasswordVisible,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: "  Confirm Password",
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
                return 'Confirm password must not be empty';
              } else if (value != password) {
                return 'Passwords do not match';
              }
              return null;
            },
            onChanged: (value) => confirmpassword = value,
          ),
        ],
      ),
    );
  }

  _signup(context) {
    
    return ElevatedButton(
      
      onPressed: _signUp,
      child: Text("Sign Up",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: Color(0xFF927CCF),
        
        padding: EdgeInsets.symmetric(vertical: 16),
        minimumSize: Size(350, 20)
      ),
    );
  }

  _text(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("   Already have an account?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
      SizedBox(width: 10,),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()), 
          );
        },
        
        child: Text("Sign In",style: TextStyle(fontSize: 16,color: Color(0xFF927CCF))),
      ),
    ],
  );
}


  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;


    User? user = await _auth.signUpWithEmailandPassword(email, password);
    if (user != null){
      print('User is Successfully created');
      Navigator.pushNamed(context, "/homescreen");


    }
    else{
      print('Some error happened');
    }
  }
}

