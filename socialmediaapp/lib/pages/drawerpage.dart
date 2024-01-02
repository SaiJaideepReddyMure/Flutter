import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 
class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  void logout() {
   
  FirebaseAuth.instance.signOut().then((value) {
     Navigator.pushReplacementNamed(context, "/login_register_page");
  }).catchError((error) {
     
  });
}

  @override
  Widget build(BuildContext context) {
    return   Drawer(
       backgroundColor:  Theme.of(context).colorScheme.background,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Column(
            children:[
          const DrawerHeader(
            child: Icon(Icons.favorite)),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                leading: const Icon(Icons.home),
                title: const Text("H O M E"),
                onTap:  (){
                  Navigator.pop(context);
                },
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("P R O F I L E"),
                onTap:  (){
                   Navigator.pop(context);
                   Navigator.pushNamed(context, "/profilepage");
                },
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                leading: const Icon(Icons.group),
                title: const Text("U S E R S"),
                onTap:  (){
                  Navigator.pop(context);
                   Navigator.pushNamed(context, "/userpage");
                },
                ),
            ),
            ]
          ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("L O G O U T"),
                onTap: logout,
                ),
            ),
            
          
        ]
    )
        ,
       );
    
  }
}