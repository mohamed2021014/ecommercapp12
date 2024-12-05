import 'package:ecomerca/core/constant/app_theme.dart';
import 'package:ecomerca/helper/bnding.dart';
import 'package:ecomerca/routes.dart';
import 'package:ecomerca/src/view/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;

import 'package:get/get.dart';

import 'src/view/screen/outh/onbording.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBPC9fWl7bJvmYbAbSYk00gZOJUVN4FtIg",
          appId: "1:205604994822:android:648a871a67125a063fe887",
          messagingSenderId: "205604994822",
          projectId: "ecommerc-fa9dc"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      getPages: getPages,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      debugShowCheckedModeBanner: false,
      home: 
       FirebaseAuth.instance.currentUser == null
          ? const OnBoarding()
          : const HomeScreen(),
      theme: AppTheme.lightAppTheme,
    );
  }
}
