import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:questginix/auth/design/welcomscreen.dart';

class Repoitory {
  Future<User?> createAccount(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      UserCredential userCrendetial = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      print("Account created Succesfull ");

      // userCrendetial.user!.updateDisplayName(name);

      return userCrendetial.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> forgotpass(String email) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      final userCrendetial =
          await _auth.sendPasswordResetEmail(email: email).then((value) {});

      print("Account created Succesfull ");

      // userCrendetial.user!.updateDisplayName(name);
      return "userCrendetial";
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future<User?> logIn(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      print("Login Sucessfull");
      _firestore.collection('users').doc(_auth.currentUser!.uid).get().then(
          (value) => userCredential.user!.updateDisplayName(value['name']));

      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.signOut().then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const WelcomScreen()));
      });
    } catch (e) {
      print("error");
    }
  }
}
