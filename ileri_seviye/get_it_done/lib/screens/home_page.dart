import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_done/models/item_data.dart';
import 'package:get_it_done/screens/settings_page.dart';
import 'package:provider/provider.dart';
import '../widgets/item_card.dart';
import 'item_adder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '${Provider.of<ItemData>(context).items.length} Items',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, left: 16, right: 16, top: 5),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Consumer<ItemData>(
                        builder: (context, itemData, child) => Align(
                          alignment: Alignment.topCenter,
                          child: buildListView(itemData),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: buildFlatBtnContainer(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  ListView buildListView(ItemData itemData) {
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) => ItemCard(
        title: itemData.items[index].title,
        isDone: Provider.of<ItemData>(context).items[index].isDone,
        toggleStatus: (_) {
          itemData.toggleStatus(index);
        },
        deleteItem: (_) {
          itemData.deleteItem(index);
        },
      ),
      itemCount: itemData.items.length,
    );
  }

  Container buildFlatBtnContainer(BuildContext context) {
    return Container(
      height: 50,
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              // barrierColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)), //calısmıyor
              context: context,
              builder: (context) => ItemAdder());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.settings,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        )
      ],
      title: const Text('Get It Done'),
    );
  }
}
