// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:alert_us/models/user.dart'as model;
// import 'package:flutter/material.dart';

// class AuthMethods {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<model.User> getUserDetails() async {
//     User currentUser = _auth.currentUser!;

//     DocumentSnapshot snap =
//         await _firestore.collection('users').doc(currentUser.uid).get();

//     return model.User.fromSnap(snap);
//   }