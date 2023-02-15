import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String secilenSehir;
  final myController = TextEditingController();

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("HATA"),
          content: new Text("Geçersiz Bir Şehir Girdiniz"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new ElevatedButton(
              child: new Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/search.jpg'))),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: myController,
//                    onChanged: (value) {
//                      secilenSehir = value;
//                      print(secilenSehir);
//                    },
                    decoration: InputDecoration(
                        hintText: 'Şehir Seçiniz',
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      var response = await http.get(
                          'https://www.metaweather.com/api/location/search/?query=${myController.text}');
                      jsonDecode(response.body).isEmpty
                          ? _showDialog()
                          : Navigator.pop(context, myController.text);
                    },
                    child: Text('Şehri Seç'))
              ],
            ),
          ),
        ));
  }
}
