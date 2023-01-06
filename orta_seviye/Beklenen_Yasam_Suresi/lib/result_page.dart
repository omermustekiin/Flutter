import 'package:beklenen_yasam_suresi/Constants.dart';
import 'package:beklenen_yasam_suresi/user_data.dart';
import 'package:flutter/material.dart';
import 'hesaplama.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;

  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuc Sayfası'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              Hesap(_userData).hesaplama().round().toString(),
              style: kMetinStili,
            )),
          ),
          Container(
            height: 45,
            child: Expanded(
              flex: 1,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.blue),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'GERİ DÖN',
                  style: kMetinStili,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
