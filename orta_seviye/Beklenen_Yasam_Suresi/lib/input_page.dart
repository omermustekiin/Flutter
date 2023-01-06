import 'package:beklenen_yasam_suresi/result_page.dart';
import 'package:beklenen_yasam_suresi/user_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';
import 'MyWidgets.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double icilenSigara = 0.0;
  double sporSayisi = 0.0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: <Widget>[
                  Text(
                    'Haftada Kaç Gün Spor Yapıyorsunuz?',
                    style: kMetinStili,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      sporSayisi.round().toString(),
                      style: kSayiStili,
                    ),
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    value: sporSayisi,
                    onChanged: (double newValue) {
                      setState(() {
                        sporSayisi = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Günde Kaç Adet Sigara Tüketiyorsunuz?',
                    style: kMetinStili,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      icilenSigara.round().toString(),
                      style: kSayiStili,
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: 30,
                      value: icilenSigara,
                      //divisions: 10,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.pink[400]
                        : Colors.white,
                    child: GenderWidget(
                      cinsiyetMetni: 'KADIN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.blue[400]
                        : Colors.white,
                    child: GenderWidget(
                      cinsiyetMetni: 'ERKEK',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 45,
            child: ButtonTheme(
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                              kilo: kilo,
                              boy: boy,
                              seciliCinsiyet: seciliCinsiyet,
                              icilenSigara: icilenSigara,
                              sporSayisi: sporSayisi))));
                },
                child: Text(
                  'HESAPLA',
                  style: kMetinStili,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: kMetinStili,
          ),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 36,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.lightBlue),
                  ),
                  child: const Icon(FontAwesomeIcons.plus, size: 10),
                  onPressed: () {
                    setState(() {
                      label == 'BOY' ? boy++ : kilo++;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ButtonTheme(
                minWidth: 36,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.lightBlue),
                  ),
                  child: const Icon(FontAwesomeIcons.minus, size: 10),
                  onPressed: () {
                    setState(() {
                      label == 'BOY' ? boy-- : kilo--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
