import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';
import '../models/comment_model.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel comment;
  const CommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ///Name
        Text(
          comment.senderName,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),

        ///Stars & Rating Text & Icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: screenSize.width / 3.85,
                  child: FittedBox(
                    child: RatingStarWidget(
                      rating: comment.rating,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  keysOfRating[comment.rating - 1],
                ),
              ],
            ),
            IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.delete,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),

        ///Comment
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: Text(
            comment.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
