import 'package:ecomerca/core/constant/app_color.dart';
import 'package:ecomerca/core/constant/apploti.dart';

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
  // ignore: use_super_parameters
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(250, 6, 34, 249), // اللون الأول
                    Color.fromARGB(234, 223, 223, 223), // اللون الثاني
                    Color.fromARGB(255, 242, 243, 240), // اللون الثالث
                  ],
                ),
              ),
              // color: const Color.fromARGB(0, 0, 0, 0),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: ListView(children: [
                  const LogoAuth(
                    titl: 'login', 
                    imge: Apploti.login,
                  ),
                  const SizedBox(height: 15),
                  CustonTextFormAuth(
                    mycontroller: controller.email,
                    hinttext: "Enter Your Email",
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "can't be Empty";
                      }
                      return null;
                    },
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
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "can't be Empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () { 
                    controller.resetpassword(context) ;
                    },
                    child: const Text(
                      "Forget Password",
                      style: TextStyle(color: Colors.blue),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  CustomButtomAuth(
                      text: "Login",
                      onPressed: () {
                         controller.loginfir( context=context);
                      //  controller.loginapi();
                        // Get.offAll(AnimatedTextPage());
                      }),
                  const SizedBox(height: 20),
                  const Text(
                    '-or logn with-',
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
              ),
            )));
  }
}
