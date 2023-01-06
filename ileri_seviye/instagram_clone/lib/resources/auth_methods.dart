import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  ///sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured from signUpUser";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        ///create/register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        ///add user to Firestore database with her datas
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );

        _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        res = "sucessfully-sign-up";
      }
    }
    /*on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'Invalid email format';
      } else if (err.code == 'weak-password') {
        res = 'password should be at least 6 characters';
      }
    }*/
    catch (err) {
      res = err.toString();
    }
    return res;
  }

  ///logging in user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured from logging in user";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "successfully-logged-in";
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found/wrong-password') {}
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
