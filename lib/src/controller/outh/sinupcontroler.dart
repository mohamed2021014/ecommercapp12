import 'package:ecomerca/core/constant/routes.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Sinupcontroler extends GetxController {}

class sinupcontrolerImp extends Sinupcontroler {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
// TODO: implement onClose
    super.onClose();
  }

  creataccount() async {
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Get.off(AppRoute.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak',
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email',
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
