import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreMethods firestoreMethods = CloudFirestoreMethods();
  Future<String> signUpUser(
      {required String name,
      required String email,
      required String password,
      required String address}) async {
    name.trim();
    email.trim();
    password.trim();
    address.trim();
    String output = "Bir şeyler yanlış gitti";

    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserDetailsModel user = UserDetailsModel(name: name, address: address);
        await firestoreMethods.uploadNameAndAddressToDatabase(user: user);

        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Lütfen tüm alanları doldurunuz.";
    }
    return output;
  }

  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    email.trim();
    password.trim();
    String output = "Bir şeyler yanlış gitti";

    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Lütfen tüm alanları doldurunuz.";
    }
    return output;
  }
}
