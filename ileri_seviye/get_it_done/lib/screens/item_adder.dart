import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item_data.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: Colors.deepPurple[50],
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                minLines: 1,
                maxLines: 4,
                controller: textController,
                onChanged: (input) {},
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add item',
                    hintText: '...'),
                autofocus: true,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                    Theme.of(context).backgroundColor),
                backgroundColor: MaterialStateProperty.all(Colors.white70),
              ),
              onPressed: () {
                Provider.of<ItemData>(context, listen: false)
                    .addItem(textController.text);
                Navigator.pop(context);
              },
              child: Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
