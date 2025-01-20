import 'package:ecomerca/core/class/curd.dart';
import 'package:ecomerca/core/constant/linkapi.dart';
import 'package:ecomerca/core/constant/routes.dart';
import 'package:ecomerca/main.dart';

import 'package:ecomerca/src/view/screen/welcom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

abstract class LoginController extends GetxController {}

class LoginControllerImp extends LoginController {
  void reloadPage() {
    //  Get.reset(); // إعادة تحميل جميع الـ Controllers
    Get.forceAppUpdate(); // إعادة تحميل الصفحة
  }

  bool isshowpassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final Crud crud = Crud();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      //  print('User is currently signed out!=============================');
      } else {
      //  print('User is signed in!===================================');
      }
    });
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
   
    super.onReady();
  }

  @override
  void onClose() {
//kk
    super.onClose();
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  loginapi() async {
    if (formstate.currentState!.validate()) {
      var response = await crud.postrespons(
          loginlink, {"email": email.text, "password": password.text});
      if (response["result"] == "scuses") {
        sharedPref.setString('id', response['data'][0]['id'].toString());
        sharedPref.setString('username', response['data'][0]['user_name']);
        sharedPref.setString('email', response['data'][0]['user_email']);
        sharedPref.setString('password', response['data'][0]['user_password']);
        Get.offAll(const AnimatedTextPage());
      } else {
        Get.snackbar('Error', 'Wrong password provided for that user or email',
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);

        // ignore: avoid_print
        print('Erorrrrrrrrrrrrrrrrrrrrr');
      }
    } else {}
  }

  loginfir(context) async {
    try { 
       if (formstate.currentState!.validate()) {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      if (credential.user!.emailVerified) {
        Get.offAll(const AnimatedTextPage());
      } else {
        QuickAlert.show(
            context: context,
            widget: const Icon(
              Icons.send,
              size: 26,
              color: Colors.blue,
            ),
            type: QuickAlertType.warning,
            text: ' We sent a verification letter to the mail.',
            barrierDismissible: false,
            title: ' email Verified',
            onConfirmBtnTap: () {
              reloadPage();
              Get.back();
            });
      } }else{}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email',
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
       // print('No user found for that email=============================.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user',
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);

       // print('Wrong password provided for that user========================.');
      }
      // print(
      //     '$e ======================================================================');
    }
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offAllNamed(AppRoute.home);
  }

  resetpassword( context) {
  try{   
    FirebaseAuth.instance.sendPasswordResetEmail(email: email.text) ;
     QuickAlert.show(
            context: context,
            widget: const Icon(
              Icons.send,
              size: 26,
              color: Colors.blue,
            ),
            type: QuickAlertType.success,
           text: 'We sent a message to Gmail',
            title: ' reset password', 
           ); }catch (a){//kkkkk 
            }

  }
}
