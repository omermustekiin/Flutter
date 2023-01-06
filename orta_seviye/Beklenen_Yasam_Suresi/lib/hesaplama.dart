import 'package:beklenen_yasam_suresi/user_data.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;

    sonuc = 90 + _userData.sporSayisi - _userData.icilenSigara;
    sonuc += _userData.boy / _userData.kilo;

    if (_userData.seciliCinsiyet == 'KADIN') {
      return sonuc + 3;
    } else
      return sonuc;

    //_userData.seciliCinsiyet == 'KADIN' ? sonuc + 3 : sonuc;
  }
}
