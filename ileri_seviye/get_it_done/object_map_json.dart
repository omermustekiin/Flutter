import 'dart:convert';

main() {
  Item itemObject = Item(title: 'uyu', isDone: false);

  //Objeyi Map ile Json a dönüştürme
  Map itemAsMap = itemObject.toMap();
  String itemAsJson = json.encode(itemAsMap);

  //tersi
  itemAsMap = json.decode(itemAsJson);
  //itemObject = Item(title: itemAsMap['title'], isDone: itemAsMap['isDone']); //Defteri açıp tek tek okuma yapar
  itemObject = Item.fromMap(itemAsMap);
  //yapıcının içine ismap yollanır gelen değerler kendi içerisinde işlenir
}

class Item {
  String title;
  bool isDone;
  //Named Constructor
  Item({this.title, this.isDone});
  Item.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        isDone = map['isDone'];

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}
