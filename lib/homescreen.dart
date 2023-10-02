// ignore_for_file: prefer_const_constructors, camel_case_types, unused_local_variable, unused_field, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables, dead_code, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_import, depend_on_referenced_packages, unnecessary_string_interpolations

// import 'dart:js_interop';

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
   String userEmail = "Guest User";
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // int _selectedIndex = 0;
  
  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

    Future<void> _getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email ?? "Guest User";
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Set the scaffoldKey
      appBar: app_bar(),
      backgroundColor: Color(0xFFECE9F4),
      drawer: _drawer(context),
      body:Stack(
        children: [
          Column(
          
          children: [
            _searchfield(),
            SizedBox(height: 20,),
            _line(),
            SizedBox(height: 20,),
            _browsetext(),
            SizedBox(height: 15,),
            _threebuttons(),
            SizedBox(height: 20,),
            _fourbuttons(),
            SizedBox(height: 20),
            _1outlinebutton(),
            SizedBox(height: 15),
            _2outlinebutton(),
            SizedBox(height: 45),
            _postad(),
            
            
            
            
            ]
        
          
        
        ),
      
       
        Positioned(
          
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavigationBar(backgroundColor: Color.fromARGB(242, 228, 225, 236),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, color:  Colors.blue),
                  label: 'Home'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Colors.black,),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(icon: IconButton(onPressed: (){
                    Navigator.pushNamed(context, "/showemail");
                  }, icon: Icon(Icons.person, color: Colors.black,),),
                  label: 'Profile'
                  ),
                ],
                
              ),
            ),
        ],
      ) ,
      
      
    
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      backgroundColor:Color(0xFFECE9F4),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header with your app name and logo
          Container(
            height: 140,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 216, 226),
                
              ),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, size: 35,),
                      SizedBox(width: 4,),
                    
                      Text(
                        'APNA GHAR',
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 5, 5),
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(width: 40,),
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.cancel_outlined))
                    ],
                  ),
                  Text('$userEmail',style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
          ),
          // Add drawer items (text buttons vertically)
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              // Handle item 1 click
              Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text('Add Property'),
            leading: Icon(Icons.add),
            onTap: () {
              // Handle item 2 click
              // Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text('Search Property'),
            
            leading: Icon(Icons.search),
            onTap: () {
              // Handle item 1 click
              // Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.info_outline),
            onTap: () {
              Navigator.pushNamed(context, "/showemail");
              // Handle item 1 click
              // Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout_sharp),
            onTap: () {
              showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  title: Text("Are you sure you want to logout?", style: TextStyle(fontSize: 17),),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);

                    }, child: Text("Cancel")),
                    TextButton(onPressed: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, "/login");

                    }, child: Text("Logout"))
                  ],

                );
              });
              // Handle item 1 click
              
              // Add your logic here
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }

  // void _onitemtapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //   if (index == 1) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => loginscreen()));
      
  //   }
  // }

  Container _postad() {
    return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Looking to sell out your property?",style: TextStyle(fontSize: 18),),
              SizedBox(height: 30),
              Container(
                width: 270,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button click logic here
                  },
                  child: Text("Post an ad",style: TextStyle(fontSize: 16),),
                ),
              ),
            ],
            
            ),
          
          
          width: 350,
          height: 131,
          decoration: ShapeDecoration(
            color: Color.fromARGB(255, 231, 230, 232),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.20000000298023224),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
        );
  }

  Row _1outlinebutton() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                 child: Text(
                  "250 Sq.Yard",
                  style: TextStyle(
                    color: Color(0xFF55A9AF),
                  ),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                 child: Text(
                  "120 Sq. Yd",
                  style: TextStyle(
                    color: Color(0xFF55A9AF),
                  ),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                 child: Text(
                  "80 Sq.Yard",
                  style: TextStyle(
                    color: Color(0xFF55A9AF),
                  ),
                ),
                onPressed: () {},
              ),
          ],
        );
  }

Row _2outlinebutton() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                 child: Text(
                  "New",
                  style: TextStyle(
                    color: Color(0xFF55A9AF),
                  ),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                 child: Text(
                  "Under 20 Lacs",
                  style: TextStyle(
                    color: Color(0xFF55A9AF),
                  ),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                 child: Text(
                  "On Installments",
                  style: TextStyle(
                    color: Color(0xFF55A9AF),
                  ),
                ),
                onPressed: () {},
              ),
          ],
        );
  }



  Row _fourbuttons() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Center(child: Text('Popular')),
              width: 71,
              height: 25,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 218, 218, 218), // Set a valid color value
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0)
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                
              ),
            ),
            
            Container(
              child: Center(child: Text('Area Size')),
              width: 71,
              height: 25,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 218, 218, 218), // Set a valid color value
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0)
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                
              ),
            ),
            Container(
              child: Center(child: Text('Location')),
              width: 71,
              height: 25,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 218, 218, 218), // Set a valid color value
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0)
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                
              ),
            ),
            Container(
              child: Center(child: Text('Type')),
              width: 71,
              height: 25,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 218, 218, 218), // Set a valid color value
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0)
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                
              ),
            ),
          ],
        );
  }

  Row _threebuttons() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            
            OutlinedButton(onPressed: (){}, child: Text("Home", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),),
            OutlinedButton(onPressed: (){}, child: Text("Plots",style: TextStyle(color:Colors.black,fontSize: 15))),
            OutlinedButton(onPressed: (){}, child: Text("Commercial", style: TextStyle(color:Colors.black,fontSize: 15))),
          ],
        );
  }

  Text _browsetext() => Text("Browse Property for Purchase", style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic,),);

  Container _line() {
    return Container(
          width: 370,
          decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
          side: BorderSide(
          width: 1,
          strokeAlign: BorderSide.strokeAlignCenter,
          color: Color.fromARGB(255, 213, 213, 213),
    ),
  ),
),
);
  }

  Container _searchfield() {
    return Container(
          margin: EdgeInsets.only(top:40 ,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for property ',
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        );
  }

  AppBar app_bar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        iconSize: 28,
          color: Colors.black,
          icon: Icon(Icons.menu,),
          onPressed: () {
             _scaffoldKey.currentState?.openDrawer();
            
            // Navigate back to the previous screen
            //Navigator.pop(context);
          },
        ),
        //leadingWidth: 20,
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, color: Colors.black, size: 30,),
            // SizedBox(width: 7,),
            Text("APNA GHAR", style: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.w500),),
          ],
        ),
        actions: [
  IconButton(
    color: Colors.black,
    
    icon: Icon(Icons.logout,),
    

    // You can use any logout icon you prefer
    onPressed: () {
              showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  title: Text("Are you sure you want to logout?", style: TextStyle(fontSize: 17),),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);

                    }, child: Text("Cancel")),
                    TextButton(onPressed: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, "/login");

                    }, child: Text("Logout"))
                  ],

                );
              });
      // Add your logout logic here
      // For example, sign out the user
      // Navigator.of(context).pushReplacementNamed('/login');
    },
  ),
],
        //centerTitle: true,
        backgroundColor:Color(0xFFECE9F4),
        
      );
  }
}




