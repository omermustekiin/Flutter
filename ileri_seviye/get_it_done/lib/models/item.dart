class Item {
  final String title;
  bool isDone;
  Item({this.title, this.isDone = false});

  //her obje gerekirse kendi statusunu degıstırecek bır methoda sahıb olmalı
  void toggleStatus() {
    isDone = !isDone; //deger true ıse false, false ise true olur.
  }

  Item.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        isDone = map['isDone'];
  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}
