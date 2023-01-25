import 'package:library_app/models/book_model.dart';
import 'package:library_app/services/calculator.dart';
import 'package:library_app/services/database.dart';
import 'package:flutter/material.dart';

class UpdateBookViewModel extends ChangeNotifier {
  Database _database = Database();
  String collectionPath = 'books';

  Future<void> updateBook(
      {String bookName,
      String authorName,
      DateTime publishDate,
      Book book}) async {
    /// Form alanındaki verileri ile önce bir book objesi oluşturulması
    Book newBook = Book(
        id: book.id,
        bookName: bookName,
        authorName: authorName,
        publishDate: Calculator.datetimeToTimestamp(publishDate));

    /// bu kitap bilgisini database servisi üzerinden Firestore'a yazacak
    await _database.setBookData(
        collectionPath: collectionPath, bookAsMap: newBook.toMap());
  }
}
