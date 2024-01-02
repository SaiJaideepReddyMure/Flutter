import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/components/mypostbutton.dart';
import 'package:socialmediaapp/components/textfeilds.dart';
import 'package:socialmediaapp/database/firestore.dart';

import 'drawerpage.dart';
class Homepage extends StatelessWidget {
   Homepage({super.key});

final FireStoreDatabase database = FireStoreDatabase();
final TextEditingController newpostController = TextEditingController();
void postmessage()
{
  if(newpostController.text.isNotEmpty)
  {
      String msg = newpostController.text;
       database.addPost(msg);
  }
  newpostController.clear();
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      resizeToAvoidBottomInset: false,
      
      appBar: AppBar(
        title: const Text("W A L L"),
        backgroundColor:  Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
         
      ),
      drawer: const Mydrawer(),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                  
                  
                  
                     
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: MyTextFeild(hintText: "Say Something", obscureText: false, controller: newpostController),
                      )
                    ),
                  
                PostButton(
            onTap: postmessage)
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(stream: database.getPostsStream(),
           builder:(context, snapshot)
            {
             if(snapshot.connectionState== ConnectionState.waiting)
             {
              return const Center(
                child: CircularProgressIndicator(),
              );
             }
             final posts = snapshot.data?.docs;
             if(snapshot.data == null || posts!.isEmpty)
             {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("No Posts"),
                    ),
                  );
             }
             return Expanded(
              child:ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) 
              {
                  final post = posts[index];
                  String message = post['PostMessage'];
                  String UserEmail = post['UserEmail'];
                  //String TimeStamp = post['TimeStamp'];

                  return Padding(
                    padding: const EdgeInsets.only(left :10.0,bottom : 25,right: 25),
                    child: ListTile(
                      title: Text(message),
                      subtitle: Text(UserEmail,style: TextStyle(color:Theme.of(context).colorScheme.secondary ),),
                    ),
                  );

                
              }) );
           }
           )
        ],
      ),

    );
  }
}