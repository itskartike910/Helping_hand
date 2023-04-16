// import 'package:chat_app/Models/UserModel.dart';
// import 'package:chat_app/pages/CompleteProfile.dart';
// import 'package:chat_app/pages/LoginPage.dart';
// import 'package:chat_app/pages/UploadImmage.dart';
// ignore_for_file: prefer_final_fields

import 'dart:developer';
import 'package:alert_us/models/user.dart' as model;
import 'package:alert_us/resources/auth_methods.dart';
import 'package:alert_us/responsive/mobile_screen_layout.dart';
import 'package:alert_us/utils/global_variable.dart';

import 'package:alert_us/utils/location.dart';
import 'package:alert_us/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _locationNickname = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // void checkValues() {
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //   String cPassword = cPasswordController.text.trim();
  //   String username = _username.text.trim();
  //   String locationNickname = _locationNickname.text.trim();
  //   if (email == "" ||
  //       password == "" ||
  //       cPassword == "" ||
  //       username == "" ||
  //       locationNickname == "") {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //       "Please fill all the field",
  //       style: TextStyle(backgroundColor: Colors.red),
  //     )));
  //     log("Please fill all the field");
  //   } else if (password != cPassword) {
  //     log("Password do not match");
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text("Password do not match")));
  //     //
  //   } else {
  //     signUp(email, password);
  //   }
  // }

  // void signUp(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password);

  //     String res = "Some error occured";
  //     model.User user = model.User(
  //       locationNickname: _locationNickname.text,
  //       address: address,
  //       username: _username.text,
  //       uid: userCredential.user!.uid,
  //     );

  //     await _firestore
  //         .collection('users')
  //         .doc(userCredential.user!.uid)
  //         .set(user.toJson());
  //     res = "success";
  //     if (userCredential.user != null) {
  //       Navigator.pop(context);
  //     }
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("User Created you can login ")));
  //     // log("User Created");
  //   } on FirebaseAuthException catch (ex) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(ex.code.toString())));
  //     log(ex.code.toString());
  //   }
  // }

  bool _isLoading = false;
  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      username: _username.text,
      cPassword: cPasswordController.text,
      locationNickname: _locationNickname.text,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MobileScreenLayout()),
      );
    }
  }

  // void saveDetails() async {
  //   String res = "Some error occured";
  //   model.User user = model.User(
  //       locationNickname: _locationNickname.text,
  //       address: address,
  //       username: _username.text);

  //        await _firestore
  //           .collection('users')
  //           .doc(userCredential.user!.uid)
  //           .set(user.toJson());
  //       res = "success";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.pink.shade50, Colors.white],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        )),
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: (Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Create new account",
                  style: TextStyle(
                    // color: Theme.of(context).colorScheme.secondary,
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Enter your email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _username,
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    prefixIcon: Icon(
                      Icons.verified_user,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _locationNickname,
                  decoration: const InputDecoration(
                    labelText: "Enter your location nickname",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: cPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    prefixIcon: Icon(
                      Icons.password_rounded,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    // Navigator.pop(context);
                    onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationPage()))
                        .then((result) {}),
                    // onPressed: () => Navigator.of(context).pushReplacement(
                    //         MaterialPageRoute(builder: (context) {
                    //       return LocationPage();
                    //     })),
                    child: const Text('Set your location')),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () {
                    signUpUser();
                  },
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        )),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?",
              style: TextStyle(fontSize: 16),
            ),
            CupertinoButton(
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(context, // Current context
                      MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
