import 'package:amazon_clone/models/comment_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../utils/utils.dart';

class CommentDialog extends StatelessWidget {
  final String productUid;
  const CommentDialog({Key? key, required this.productUid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return RatingDialog(
      title: const Text(
        'Bir yorum yaz',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      submitButtonText: 'Ekle',
      starSize: 28,
      showCloseButton: true,
      commentHint: 'Buraya yazın',
      onCancelled: Navigator.of(context).pop,
      onSubmitted: (RatingDialogResponse res) async {
        CloudFirestoreMethods().uploadCommentToDatabase(
            productUid: productUid,
            model: CommentModel(
                senderName:
                    Provider.of<UserDetailsProvider>(context, listen: false)
                        .userDetails
                        .name,
                description: res.comment,
                rating: res.rating.toInt()));
      },
    );
  }
}
