import 'package:library_app/models/book_model.dart';
import 'package:library_app/services/calculator.dart';
import 'package:library_app/views/add_book_view_model.dart';
import 'package:library_app/views/update_book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateBookView extends StatefulWidget {
  final Book book;

  const UpdateBookView({this.book});

  @override
  _UpdateBookViewState createState() => _UpdateBookViewState();
}

class _UpdateBookViewState extends State<UpdateBookView> {
  TextEditingController bookCtr = TextEditingController();
  TextEditingController authorCtr = TextEditingController();
  TextEditingController publishCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _selectedDate;

  @override
  void dispose() {
    bookCtr.dispose();
    authorCtr.dispose();
    publishCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bookCtr.text = widget.book.bookName;
    authorCtr.text = widget.book.authorName;
    publishCtr.text = Calculator.dateTimeToString(
        Calculator.datetimeFromTimestamp(widget.book.publishDate));

    return ChangeNotifierProvider<UpdateBookViewModel>(
      create: (_) => UpdateBookViewModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(title: Text('Kitap Bilgisi Güncelle')),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                    controller: bookCtr,
                    decoration: InputDecoration(
                        hintText: 'Kitap Adı', icon: Icon(Icons.book)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kitap Adı Boş Olamaz';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                    controller: authorCtr,
                    decoration: InputDecoration(
                        hintText: 'Yazar Adı', icon: Icon(Icons.edit)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Yazar Adı Boş Olamaz';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                    onTap: () async {
                      _selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(-1000),
                          lastDate: DateTime.now());

                      publishCtr.text =
                          Calculator.dateTimeToString(_selectedDate);
                    },
                    controller: publishCtr,
                    decoration: InputDecoration(
                        hintText: 'Basım Tarihi', icon: Icon(Icons.date_range)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen Tarih Seçiniz';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Güncelle'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      /// kulanıcı bilgileri ile addNewBook metodu çağırılacak,
                      await context.read<UpdateBookViewModel>().updateBook(
                          bookName: bookCtr.text,
                          authorName: authorCtr.text,
                          publishDate: _selectedDate ??
                              Calculator.datetimeFromTimestamp(
                                  widget.book.publishDate),
                          book: widget.book);

                      /// navigator.pop
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
