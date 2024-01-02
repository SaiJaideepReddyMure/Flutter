// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/components/textfeilds.dart';

import '../components/Mybutton.dart';
import '../errors/errordisplay.dart';
class Registrationpage extends StatefulWidget {
      final void Function()? onTap;
    const Registrationpage({super.key, required this.onTap});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  final TextEditingController usercontroller = TextEditingController();

  final TextEditingController passcontroller =  TextEditingController();

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController cpasscontroller = TextEditingController();

  Future<void> register()
  async {
        showDialog(context: context, builder:  (context) => const Center(
          child: CircularProgressIndicator(),
        ));

        if(passcontroller.text != cpasscontroller.text)
        {
             Navigator.pop(context);
             displayerrormessage("password is not matching",context);
              
        }
        else
        {
          try{
          UserCredential? usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontroller.text, 
            password: passcontroller.text);
          Navigator.pop(context);
          createuserdocument(usercredential);
        }
        on FirebaseAuthException catch(e){
          
          Navigator.pop(context);
          displayerrormessage(e.code,context);

        }
        }
        


  }

 Future<void> createuserdocument(UserCredential? userCredential) async{
  if(userCredential!= null && userCredential.user !=null)
  {
    await FirebaseFirestore.instance
    .collection("Users")
    .doc(userCredential.user!.email)
    .set({
      'Email':userCredential.user?.email,
      'Username':usercontroller.text,
    });
     
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // SingleChildScrollView
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Center(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column( 
            mainAxisAlignment :MainAxisAlignment.center,
            children: [
               Icon(Icons.person, 
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
         ),
        const SizedBox(height: 25,),
            // appname
         const Text("J A I S H I V",
         style: TextStyle(
            fontSize: 34)
            ),
            const SizedBox(height: 25),
            MyTextFeild(
            
        hintText: 'Username', controller:usercontroller , obscureText: false,
            ),
            Container(height: 10,),
            //email
         MyTextFeild(
            
        hintText: 'Email', controller:emailcontroller , obscureText: false,
            ),
            Container(height: 10,),
            MyTextFeild(
            
        hintText: 'password', controller:passcontroller , obscureText: true,
            ),

            Container(height: 10,),
            MyTextFeild(
            
        hintText: 'confirm password', controller:cpasscontroller , obscureText: true,
            ),
            Container(height: 10,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     TextButton(onPressed: (){}, 
          //     child: 
          //      Text("Forgot password?",
          //     style: TextStyle(
          //       color: Theme.of(context).colorScheme.inversePrimary,          
          //     ),
          //     )
          //     ),

          //   ],
            
          // ),
          Mybutton(text: "Register",onTap: register,),
        
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Already have an account ?",
               style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
               GestureDetector(
                onTap: widget.onTap,
                  child:const Text("Login Here",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
               )
                
            ],
          ),
          
          
          
             
             
            
        ],

        ),
          )
        ),
      ),
    );
  }
}