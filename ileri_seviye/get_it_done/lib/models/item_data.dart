//provider paketi ile buradaki görev verilerini widget ağacında yayınlayacagım.
//Listeler ListView ile build edilirken buradaki veriler okunacak.

import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [];
  static SharedPreferences _sharedPref;
  List<String> _itemsAsString = [];

  //bır gorevın statusunu degısterecek bır method.
  //int index bilgisini alarak listedeki kaçıncı indeksteki elemanın statusunu degıstırecegını bildiririz
  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners(); //state değişikliğini tüm widgetlere duyurur.
  }

  void addItem(String title) {
    _items.add(Item(title: title));
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView get items => UnmodifiableListView(_items);

  //Shared Pref Metotları
  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  } //ana fonksiyon içinde async olarak çalışır.

  void saveItemsToSharedPref(List<Item> items) {
    // 1) List<Item> --> List<String>
    _itemsAsString.clear();

    //items listesinin içindeki var tipindeki itemları al ve işlem yapma döngüsünü başlat
    //item map e cevirilip json encode edilerek string oldu ve add ile ilk öğe olarak ekledi.
    // items içindeki eleman sayısı kadar tekrarlanır.
    for (var item in items) {
      _itemsAsString.add(json.encode(item.toMap()));
    }
    // 2) sharedprefere kaydetsin
    _sharedPref.setStringList('toDoData', _itemsAsString);
  } //kullanıcının değişiklik yaptığı anda çalışmalı

  void loadItemsFromSharedPref() {
    //ilk data çekildiğinde null ise kontrol edilsin
    List<String> tempList = _sharedPref.getStringList('toDoData') ?? [];
    //temizledikten sonra hafızadan cektıgı string listesini for donguusnde işleme sokmak gerekir.
    _items.clear();

    for (var item in tempList) {
      _items.add(Item.fromMap(jsonDecode(item)));
    }
  } //Uygulama ilk açıldığında material app return edilmeden önce çalışmalı
}
