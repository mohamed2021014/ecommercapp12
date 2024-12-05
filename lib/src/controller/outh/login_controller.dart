

import 'package:ecomerca/core/constant/routes.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


abstract class LoginController extends GetxController {}

class LoginControllerImp extends LoginController {

  bool isshowpassword = true;
TextEditingController email =TextEditingController() ;
TextEditingController password =TextEditingController() ;


 
  @override
  void onInit() {
   
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!=============================');
    } else {
      print('User is signed in!===================================');
    }
  });
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

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
  loginfir() async{ 

    try {
  // ignore: unused_local_variable
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email.text,
    password: password.text
  );  Get.off( AppRoute.home);
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {  
      Get.snackbar('Error' , 'No user found for that email' ,
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    print('No user found for that email=============================.'); 

  } else if (e.code == 'wrong-password') {  
     Get.snackbar('Error' , 'Wrong password provided for that user' ,
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);

    print('Wrong password provided for that user========================.');
  }
}
  }  



Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
if(googleUser==null){
  return ;
}
  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
   await FirebaseAuth.instance.signInWithCredential(credential); 
  Get.offAllNamed(  AppRoute.home) ;
} 


  

  
}

