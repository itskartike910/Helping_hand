// import 'package:chat_app/Models/UserModel.dart';
// import 'package:chat_app/pages/CompleteProfile.dart';
// import 'package:chat_app/pages/LoginPage.dart';
// import 'package:chat_app/pages/UploadImmage.dart';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController cPasswordController=TextEditingController();

  void checkValues(){
    String email=emailController.text.trim();
    String password=passwordController.text.trim();
    String cPassword=cPasswordController.text.trim();
    if(email==""||password==""||cPassword=="") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(

              content: Text("Please fill all the field",style: TextStyle(backgroundColor: Colors.red),))
      );
      log("Please fill all the field");
    }
    else if(password!=cPassword){
      log("Password do not match");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password do not match"))
      );
      // const Card(
      //   child: SnackBar(
      //     content: Text("Password do not match"),
      //     backgroundColor: Colors.green,
      //     elevation: 10,
      //     behavior: SnackBarBehavior.floating,
      //     margin: EdgeInsets.all(5),
      //   ),
      // );
    }
    else{
      signUp(email, password);
    }

  }

  void signUp(String email , String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user!=null)
        {
          Navigator.pop(context);
        }
      ScaffoldMessenger.of( context ).showSnackBar(
          const SnackBar(content: Text("User Created you can login "))
      );
      // log("User Created");
    } on FirebaseAuthException catch(ex){
      ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(ex.code.toString()))
      );
      //  Card(
      //    child: SnackBar(
      //     content: Text(ex.code.toString()),
      //     backgroundColor: Colors.green,
      //     elevation: 10,
      //     behavior: SnackBarBehavior.floating,
      //     margin: const EdgeInsets.all(5),
      // ),
      //  );
      log(ex.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade50,Colors.white],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: const [0.0,1.0],
              tileMode: TileMode.clamp,
            )
        ),

        padding: EdgeInsets.symmetric(horizontal: 40),
        child: (
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("Create new account",
                      style: TextStyle(
                        // color: Theme.of(context).colorScheme.secondary,
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Enter your email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        prefixIcon: Icon(Icons.email,color: Colors.pinkAccent,),

                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        prefixIcon: Icon(Icons.password,color: Colors.pinkAccent,),

                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      controller: cPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        prefixIcon: Icon(Icons.password_rounded,color: Colors.pinkAccent,),

                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: (){
                      checkValues();
                    },
                        child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ),
            )
        ),

      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?",
              style: TextStyle(fontSize: 16),),

            CupertinoButton(child: const Text("Login",
              style: TextStyle(
                  fontSize: 16
              ),
            ), onPressed: (){
              Navigator.push(
                  context,   // Current context
                  MaterialPageRoute(builder: (context){
                    return const LoginPage();
                  }
                  )
              );
            }),

          ],
        ),
      ),
    );

  }
}
