

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 

import 'Mybackbutton.dart';

class Profileuserpage extends StatelessWidget {
   Profileuserpage({super.key});
  final User? currentuser = FirebaseAuth.instance.currentUser;
  Future<DocumentSnapshot<Map<String,dynamic>>> getUserDetails() async 
          {
        return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentuser!.email)
        .get();
          }
      

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Profile "),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
      
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
        future : getUserDetails(),
        builder:(context,snapshot)
        {
           if(snapshot.connectionState == ConnectionState.waiting)
           {
            return const Center(
              child: CircularProgressIndicator(),
            );
           } 
           else if(snapshot.hasError)
           {
            return Text("Errors : $snapshot.error");
           }
            else if(snapshot.hasData)
           {
            Map<String,dynamic>? user = snapshot.data?.data();
            return  Center(
              child: Column(
                children:[
                  const Padding(
                    padding: EdgeInsets.only(top:50.0,left: 25),
                    child: Row(
                      children: [
                        Mybackbutton(),
                      ],
                    ),
                    
                  ),
                  const SizedBox(height : 24),

                  Container(
                    decoration:
                    BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                     
                      child : const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Icon(Icons.person, size: 68,),
                      ),
                      
                     ),
                Text(user?['Email']),
                Text(user?['Username']),
                ]
              ),

            );
           }
           else {
            return const Text("No data");
           }
            
           
        }

        )  
      
    );
  }
}