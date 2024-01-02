import 'package:flutter/material.dart';
void displayerrormessage(String msg,BuildContext context)
{
showDialog(context: context, builder: (context) => 
AlertDialog(
  title: Text(msg),
));
}