import 'package:flutter/material.dart';
import 'package:get_it_done/models/color_theme_data.dart';
import 'package:get_it_done/screens/home_page.dart';
import 'package:get_it_done/screens/splashScreen_page.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'models/item_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(
        create: (BuildContext context) => ItemData()),
    ChangeNotifierProvider<ColorThemeData>(
        create: (context) => ColorThemeData())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();
    //Provider.of<ItemData>(context).loadItemsFromSharedPref();

    return Consumer2<ItemData, ColorThemeData>(
      builder: (context, itemData, colorThemeData, child) {
        itemData.loadItemsFromSharedPref();
        colorThemeData.loadThemeFromSharedPref();

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ColorThemeData>(context).selectedThemeData,
          home: SplashWidget(),
        );
      },
    );
  }
}
