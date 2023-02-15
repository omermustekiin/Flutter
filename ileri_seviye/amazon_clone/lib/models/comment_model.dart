class CommentModel {
  final String senderName;
  final String description;
  final int rating;

  CommentModel({
    required this.senderName,
    required this.description,
    required this.rating,
  });

  factory CommentModel.getModelFromJson({required Map<String, dynamic> json}) {
    return CommentModel(
        senderName: json["senderName"],
        description: json["description"],
        rating: json["rating"]);
  }

  Map<String, dynamic> getJson() => {
        'senderName': senderName,
        'description': description,
        'rating': rating,
      };
}
