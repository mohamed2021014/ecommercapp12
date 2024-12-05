import 'package:ecomerca/core/constant/app_color.dart';

import 'package:ecomerca/core/funcation/alertexitapp.dart';
import 'package:ecomerca/src/controller/outh/login_controller.dart';

import 'package:ecomerca/src/view/screen/outh/signup.dart';
import 'package:ecomerca/src/view/widget/outh/custombuttonauth.dart';

import 'package:ecomerca/src/view/widget/outh/customtextformauth.dart';

import 'package:ecomerca/src/view/widget/outh/logoauth.dart';
import 'package:ecomerca/src/view/widget/outh/rowsocil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetWidget<LoginControllerImp> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: Container( color: const Color.fromARGB(0, 0, 0, 0),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(children: [
               
                const LogoAuth( titl: 'login',),
                const SizedBox(height: 15),
                CustonTextFormAuth(
                  mycontroller: controller.email,
                  hinttext: "Enter Your Email",
                  iconData: Icons.email_outlined,
                  labeltext: "Email",
                ),
                GetBuilder<LoginControllerImp>(
                  init: LoginControllerImp(),
                  builder: (controller) => CustonTextFormAuth(
                    mycontroller: controller.password,
                    obscureText: controller.isshowpassword,
                    hinttext: "Enter Your Password",
                    iconData: Icons.lock_outline,
                    onTap: controller.showPassword,
                    labeltext: "Password",
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forget Password",
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.end,
                  ),
                ),
                CustomButtomAuth(
                    text: "Sign In",
                    onPressed: () {
                      controller.loginfir();
                    }),
                const SizedBox(height: 20),
                const Text(
                  '-or sign in with-',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Rowsocil(
                  onTapgoogle: () {
                    controller.signInWithGoogle();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ? "),
                    InkWell(
                      onTap: () {
                        Get.off(Signup());
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(
                              color: AppColor.primrecolor,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                )
              ]),
            )));
  }
}
