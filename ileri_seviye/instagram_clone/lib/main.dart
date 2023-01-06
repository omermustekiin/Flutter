import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/consts & utils//colors.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/responsive/mobile_screen.dart';
import 'package:instagram_clone/responsive/responsive_layout_screens.dart';
import 'package:instagram_clone/responsive/web_screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/widgets/myCircularProgressIndicator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDo7-Sdahg0_wV_EADSsJcAh5gy6cOznNs',
          appId: '1:591065746568:web:3d8d6e36df83271a4fe33d',
          messagingSenderId: '591065746568',
          projectId: 'instagram-clone-c65cd',
          storageBucket: 'instagram-clone-c65cd.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        title: "Instagram Clone",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(),
                  mobileScreenLayout: MobileScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Snapshot error: ${snapshot.error}"),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: MyCircularProgressIndicator(),
              );
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
