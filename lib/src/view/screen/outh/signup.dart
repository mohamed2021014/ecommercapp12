import 'package:ecomerca/core/constant/app_color.dart';
import 'package:ecomerca/core/constant/apploti.dart';

import 'package:ecomerca/src/controller/outh/sinupcontroler.dart';

import 'package:ecomerca/src/view/screen/outh/login.dart';
import 'package:ecomerca/src/view/widget/outh/custombuttonauth.dart';

import 'package:ecomerca/src/view/widget/outh/customtextformauth.dart';

import 'package:ecomerca/src/view/widget/outh/logoauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends GetWidget<sinupcontrolerImp> {
  // ignore: prefer_const_constructors_in_immutables
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const LogoAuth(
              titl: 'Sign Up',
              imge: Apploti.sinup,
            ),
            const SizedBox(height: 15),
            CustonTextFormAuth(
              validator: (val) {
                if (val!.isEmpty) {
                  return "can't be Empty";
                }
              
                return null;
              },
              hinttext: "Enter Your Username",
              iconData: Icons.person_outline_rounded,
              labeltext: "Username",
              mycontroller: controller.username,
            ),
            CustonTextFormAuth(
              validator: (val) {
                if (val!.isEmpty) {
                  return "can't be Empty";
                } 
                  final regex =
                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if (!regex.hasMatch(val)) {
                  return 'Invalid email';
                }
                return null;
              },
              mycontroller: controller.email,
              hinttext: "Enter Your Email",
              iconData: Icons.email_outlined,
              labeltext: "Email",
            ),
            CustonTextFormAuth(
              validator: (val) {
                if (val!.isEmpty) {
                  return "can't be Empty";
                }
                return null;
              },
              mycontroller: controller.password,
              hinttext: "Enter Your Password",
              iconData: Icons.lock_outline,
              labeltext: "Password",
            ),
            CustomButtomAuth(
                text: "Sign up",
                onPressed: () {
                  controller.creataccount(context = context);

                  //controller.signup();
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(' have an account ? '),
                InkWell(
                  onTap: () => Get.off(const Login()),
                  child: const Text(" sign in",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColor.primrecolor,
                          fontWeight: FontWeight.bold)),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
