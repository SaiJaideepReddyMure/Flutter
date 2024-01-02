
 
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/authpages/LoginorRegister.dart';
import 'package:socialmediaapp/authpages/auth.dart';
import 'package:socialmediaapp/firebase_options.dart';
import 'package:socialmediaapp/pages/homepage.dart';
import 'package:socialmediaapp/pages/profileuserpage.dart';
import 'package:socialmediaapp/pages/userspage.dart';
import 'package:socialmediaapp/themes/dark_theme.dart';
import 'package:socialmediaapp/themes/light_theme.dart';

 

 
 

void main() async{
WidgetsFlutterBinding.ensureInitialized();
 

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       //home: Registrationpage(),
      //home: const LoginorRegister(),
      home : const Authen(),
       theme: lightMode,
        
       darkTheme: darkMode,

       routes: {
        "/login_register_page":((context) => const LoginorRegister()),
        "/homepage":(context) =>  Homepage(),
        "/profilepage":(context) =>  Profileuserpage(),
        "/userpage":(context) => const Userspage(),

       },
    );
  }
}

 