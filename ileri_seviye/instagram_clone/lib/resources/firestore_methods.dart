import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

import '../models/post.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///upload post
  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profImage) async {
    String res = "Some error occured from uploadPost";
    try {
      Future<String> photoUrl =
          StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl.toString(),
        profImage: profImage,
        likes: [],
      );

      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "successfully-posted";
    } catch (err) {
      res = "Something wrong with posting: ${err}";
    }
    return res;
  }
}
