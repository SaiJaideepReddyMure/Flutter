import 'package:flutter/material.dart';
class MyTextFeild extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const MyTextFeild({super.key,required this.hintText,required this.obscureText,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText :obscureText,
       
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        hintText: hintText,
        
      ),
    );
  }
}