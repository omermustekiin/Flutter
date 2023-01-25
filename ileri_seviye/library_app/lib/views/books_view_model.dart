import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/services/database.dart';
import 'package:flutter/material.dart';

class BooksViewModel extends ChangeNotifier {
  /// bookview'ın state bilgisini tutmak
  /// bookview arayüzünün ihtiyacı olan metotları ve hesaplamalrı yapmak
  /// gerekli servislerle konuşmak
  String _collectionPath = 'books';

  Database _database = Database();

  Stream<List<Book>> getBookList() {
    /// stream<QuerySnapshot> --> Stream<List<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getBookListFromApi(_collectionPath)
        .map((querySnapshot) => querySnapshot.docs);

    ///Stream<List<DocumentSnapshot>> --> Stream<List<Book>>
    Stream<List<Book>> streamListBook = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Book.fromMap(docSnap.data()))
            .toList());

    return streamListBook;
  }

  Future<void> deleteBook(Book book) async {
    await _database.deleteDocument(referecePath: _collectionPath, id: book.id);
  }
}
