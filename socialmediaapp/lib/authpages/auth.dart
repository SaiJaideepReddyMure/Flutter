import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/authpages/LoginorRegister.dart';
import 'package:socialmediaapp/pages/homepage.dart';
 
class Authen extends StatelessWidget {
  const Authen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       resizeToAvoidBottomInset: false,
         body: StreamBuilder(
          stream:  FirebaseAuth.instance.authStateChanges(), 
          builder: (context, snapshot) {
            if(snapshot.hasData)
            {
              return   Homepage();
            }
            else{
              return const LoginorRegister();
            }
          }, ),
    );
  }
}