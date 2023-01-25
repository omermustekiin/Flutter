import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String id;
  final String bookName;
  final String authorName;
  final Timestamp publishDate;

  Book({this.id, this.bookName, this.authorName, this.publishDate});

  /// objeden map oluşturan

  Map<String, dynamic> toMap() => {
        'id': id,
        'bookName': bookName,
        'authorName': authorName,
        'publishDate': publishDate
      };

  /// mapTen obje oluşturan yapıcı

  factory Book.fromMap(Map map) => Book(
      id: map['id'],
      bookName: map['bookName'],
      authorName: map['authorName'],
      publishDate: map['publishDate']);
}
