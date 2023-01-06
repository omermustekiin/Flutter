import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DrumPage(),
      ),
    );
  }
}

class DrumPage extends StatelessWidget {
  final oynatici = AudioPlayer();

  void sesiCal(String ses) {
    oynatici.play(AssetSource('assets/$ses.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('bongo', Colors.blueAccent),
                  ),
                  Expanded(
                    child: buildDrumPad('bip', Colors.redAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('clap1', Colors.purpleAccent),
                  ),
                  Expanded(
                    child: buildDrumPad('clap2', Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('clap3', Colors.orangeAccent),
                  ),
                  Expanded(
                    child: buildDrumPad('crash', Colors.cyanAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('how', Colors.pinkAccent),
                  ),
                  Expanded(
                    child: buildDrumPad('ridebel', Colors.brown),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildDrumPad(String ses, Color renk) {
    return TextButton(
      onPressed: () {
        sesiCal(ses);
      },
      child: Container(
        color: renk,
      ),
    );
  }
}
