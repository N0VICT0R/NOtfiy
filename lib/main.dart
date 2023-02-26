import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'login (2).dart';
// import 'package:notify5/services/theme.dart';
// import 'package:notify5/ui/Home%20page.dart';
// import 'package:notify5/ui/Te.dart';
import 'IntroScreen.dart';
// import 'Student.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      accentColor: Colors.black,
    ),

      home: OnBoardingPage(),
      // home: const Student(),
    );
  }
}
