import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_maven/db/db_helper.dart';
import 'package:task_maven/services/theme_Services.dart';
import 'UI/home_page.dart';
import 'UI/my_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lightMode,
      darkTheme: MyThemes.darkMode,
      themeMode: ThemeService().theme,
      home: const SafeArea(child: HomePage()),
    );
  }
}
