import 'package:firebase_authntication/Controller/AppInIt.dart';
import 'package:firebase_authntication/Prefrence/Prefrence.dart';
import 'package:firebase_authntication/view/Splash/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Prefs prefrance = Prefs.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefrance.setPreferences();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppInitialbinding(),
      home: SplashScreen(),
    );
  }
}
