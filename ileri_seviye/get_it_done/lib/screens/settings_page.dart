import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/color_theme_data.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Theme'),
      ),
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text purpleText = Text(
      'DeepPurple',
      style: TextStyle(color: Theme.of(context).primaryColor),
    );
    Text indigoText = Text(
      'Indigo',
      style: TextStyle(color: Colors.indigoAccent),
    );
    bool _value = Provider.of<ColorThemeData>(context).isPurple;

    return Card(
      child: SwitchListTile(
        subtitle: _value ? purpleText : indigoText,
        title: Text(
          'Change Theme Color',
          style: TextStyle(color: Colors.black),
        ),
        value: _value,
        onChanged: (bool value) {
          Provider.of<ColorThemeData>(context, listen: false)
              .switchTheme(value);
        },
      ),
    );
  }
}
