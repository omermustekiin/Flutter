import 'package:bilgi_testi/soru.dart';

class TestVeri {
  int _soruIndex = 0;

  List<Soru> _soruBankasi = [
    Soru(
        soruMetni: 'Titanic gelmis gecmiş en büyük gemidir', soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan say1sindan fazladır',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin önrü bir gündür', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fistiği aslında bir meyvenin sapidır',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hic patates yememistir',
        soruYaniti: true),
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruIndex < _soruBankasi.length - 1) {
      _soruIndex++;
    }
  }

  bool testBittiMi() {
    if (_soruIndex + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    _soruIndex = 0;
  }
}
