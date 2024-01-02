// ignore: file_names
import 'package:flutter/material.dart';
import 'package:socialmediaapp/pages/loginpage.dart';
import 'package:socialmediaapp/pages/registrationpage.dart';
class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
       
      return Loginpage(onTap: togglePages);
    } else {
       
      return Registrationpage(onTap: togglePages);
    }
  }
}
