
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreDatabase
{
  User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference posts = FirebaseFirestore.instance.collection('Posts');
  Future<void> addPost(String message) async
  {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await posts.add({
          'UserEmail': currentUser.email,
          'PostMessage': message,
          'TimeStamp': Timestamp.now(),
        });
      }
    } catch (error) {
      // Handle the error
      print("Error adding post: $error");
    }
  }
  Stream<QuerySnapshot> getPostsStream()
  {
    final postsStrem = FirebaseFirestore.instance
    .collection('Posts')
    .orderBy('TimeStamp',descending: true)
    .snapshots();
    return postsStrem;
  }
}