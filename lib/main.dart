
import 'package:ecomerca/helper/bnding.dart';
import 'package:ecomerca/routes.dart';
import 'package:ecomerca/src/view/screen/outh/onbording.dart';
import 'package:ecomerca/src/view/screen/welcom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'dart:ui' show PointerDeviceKind;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  //firbase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBPC9fWl7bJvmYbAbSYk00gZOJUVN4FtIg",
          appId: "1:205604994822:android:648a871a67125a063fe887",
          messagingSenderId: "205604994822",
          projectId: "ecommerc-fa9dc"));
 // HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}   
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: Binding(),
        getPages: getPages,
        debugShowCheckedModeBanner: false,
        home:
        // HomeScreenn()
        // sharedPref.getString('id') == null
        //     ? const OnBoarding()
        //     : const AnimatedTextPage(),
        FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified
            ? const AnimatedTextPage()
            : const OnBoarding(),

        // theme:
        );
  }
}
