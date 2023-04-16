import 'package:alert_us/main.dart';
import 'package:alert_us/utils/global_variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alert_us/models/user.dart' as model;
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String cPassword,
    required String username,
    required String locationNickname,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          cPassword.isNotEmpty ||
          locationNickname.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        //add user to database
        model.User user = model.User(
          locationNickname: locationNickname,
          address: address,
          username: username,
          uid: deviceToken,
          // deviceToken:deviceToken,
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
        result=true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        res = 'The email address is badly formatted.';
      } else if (e.code == 'weak-password') {
        res = 'Password should be atlest 6 characters';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}


