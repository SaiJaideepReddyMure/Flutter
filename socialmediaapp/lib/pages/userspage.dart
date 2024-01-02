import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/errors/errordisplay.dart';

import 'Mybackbutton.dart';

class Userspage extends StatelessWidget {
  const Userspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
        title: const Text("Users"),
        centerTitle: true,
        leading: const Mybackbutton(), // Adding the back button
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            displayerrormessage("Something went wrong", context);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return const Center(child: Text("No Data"));
          }
          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(user['Username']),
                    subtitle: Text(user['Email']),
                    // You can add more information or actions here
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
