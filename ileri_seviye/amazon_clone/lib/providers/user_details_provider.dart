import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:flutter/material.dart';
import '../models/user_details_model.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  ///for null error
  UserDetailsProvider()
      : userDetails =
            UserDetailsModel(name: "Yükleniyor", address: "Yükleniyor");

  Future getData() async {
    userDetails = await CloudFirestoreMethods().getNameAndAddress();
    notifyListeners();
  }
}
