import 'dart:io';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'controllers/common_controller.dart';
import 'pages/splash_screen.dart';
import 'utils/mytheme.dart';

import 'controllers/location_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid 
  ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB3V4vLjvl3h4LfhJOABZQHoH6DIs5H29A", 
      appId: "1:742299353813:android:8c3e881a2dfc379ffe585c", 
      messagingSenderId: "742299353813", 
      projectId: "movie-tickets-app-6a8b8"
    )
  )
  :await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    appleProvider: AppleProvider.appAttest,
    androidProvider: AndroidProvider.debug,
  );
  Get.put(AuthController());
  Get.put(LocationController());
  Get.put(CommonController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}