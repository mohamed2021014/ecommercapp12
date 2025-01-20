import 'dart:async';


import 'package:ecomerca/core/class/curd.dart';
import 'package:ecomerca/core/constant/linkapi.dart';
import 'package:ecomerca/core/constant/routes.dart';
import 'package:ecomerca/src/view/screen/welcom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Sinupcontroler extends GetxController {}

late Timer timer;

// ignore: camel_case_types
class sinupcontrolerImp extends Sinupcontroler {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  final Crud _crud = Crud(); 
     String? user ='m'  ;
       String? em ='email' ;
     
  // تحميل القيمة المحفوظة من SharedPreferences
  Future<void> _loadSavedValue() async {
    final prefs = await SharedPreferences.getInstance();
   
      user = prefs.getString('user')??'username'  ;  
       em =prefs.getString('email') ??'email' ; 


      update(); // إذا كانت القيمة غير موجودة
 
  }

  // حفظ القيمة داخل SharedPreferences
  Future<void> _saveValue(String value ,String value1) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', value); // حفظ القيمة 
     await prefs.setString('email', value1); 
    _loadSavedValue(); // تحميل القيمة الجديدة بعد الحفظ
  }



  @override
  // ignore: unnecessary_overrides
  void onInit() { 
_loadSavedValue() ;
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  signup() async {
    if (formstate.currentState!.validate()) {
      var response = await _crud.postrespons(linksignup, {
        "username": username.text,
        "email": email.text,
        "password": password.text
      });
      if (response['status'] == "sucsses") {
        Get.offAll(const AnimatedTextPage());
      } else {
        // ignore: avoid_print
        print('Erorrrrrrrrrrrrrrrrrrrrr');
      }
    } else {}
  }

  creataccount(context) async {
    try {
      if (formstate.currentState!.validate()) {
        // ignore: unused_local_variable
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        ); _saveValue(username.text ,email.text) ;
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        QuickAlert.show(
            context: context,
            widget: const Icon(
              Icons.send,
              size: 26,
              color: Colors.blue,
            ),
            type: QuickAlertType.info,
            text: ' We sent a verification letter to the mail.',
            barrierDismissible: false,
            title: ' email Verified',
            onConfirmBtnTap: () {
              Get.offNamed(AppRoute.login);
            });
      } else {} 
      
      //Get.offNamed(AppRoute.login);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak',
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
      //  print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email',
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
       // print('The account already exists for that email.');
      }
    } catch (e) {
      Get.snackbar('', '$e',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);

     // print(e);
    }
  }
}
