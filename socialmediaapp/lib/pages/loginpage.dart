 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/components/textfeilds.dart';
import 'package:socialmediaapp/errors/errordisplay.dart';
import '../components/Mybutton.dart';
import 'homepage.dart';
 
class Loginpage extends StatefulWidget {

   final void Function()? onTap; 
  const Loginpage({super.key, required  this.onTap,});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailcontroller = TextEditingController() ;

  final TextEditingController passcontroler =  TextEditingController();

  void login() async
  {
    showDialog(context: context, builder: ((context) => const Center(
      child: CircularProgressIndicator(),
      
    )));
    try 
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text,
      password: passcontroler.text,);
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) =>  Homepage()),);
    }on FirebaseAuthException catch (e)
    {
      Navigator.pop(context);
      displayerrormessage(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
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
          //email
       MyTextFeild(
          
      hintText: 'Email', controller:emailcontroller , obscureText: false,
          ),
          Container(height: 10,),
          MyTextFeild(
          
      hintText: 'password', controller:passcontroler , obscureText: true,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: (){}, 
            child: 
             Text("Forgot password?",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,          
            ),
            )
            ),

          ],
          
        ),
        Mybutton(text: "Login",onTap:login,),
      
        const SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Don't have an account ?",
             style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
             GestureDetector(
              onTap:widget.onTap,  
            
               
              child:
                const Text("Register Here",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        )
             )
             ,
          ],
        ),
        
        
        
           
           
          
      ],

      ),
        )
      ),
    );
  }
}