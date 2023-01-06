import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function toggleStatus; //Item'ın toggleStatus metoduna erişecek callback
  void Function(DismissDirection) deleteItem; //

  ItemCard({this.title, this.isDone, this.toggleStatus, this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      key: UniqueKey(),
      child: Card(
        color: isDone ? Colors.deepPurple[200] : Colors.white,
        elevation: isDone ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(title,
              style: TextStyle(
                  color: Colors.black87,
                  decoration: isDone ? TextDecoration.lineThrough : null)),
          trailing: Checkbox(
            onChanged: toggleStatus,
            value: isDone,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
