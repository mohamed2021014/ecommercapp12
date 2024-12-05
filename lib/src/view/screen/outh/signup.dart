import 'package:ecomerca/core/constant/app_color.dart';

import 'package:ecomerca/src/controller/outh/sinupcontroler.dart';

import 'package:ecomerca/src/view/screen/outh/login.dart';
import 'package:ecomerca/src/view/widget/outh/custombuttonauth.dart';

import 'package:ecomerca/src/view/widget/outh/customtextformauth.dart';

import 'package:ecomerca/src/view/widget/outh/logoauth.dart';
import 'package:ecomerca/src/view/widget/outh/rowsocil.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends GetWidget<sinupcontrolerImp> {
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
           LogoAuth( titl: 'Sign Up'),
          const SizedBox(height: 15),
          const CustonTextFormAuth(
            hinttext: "Enter Your Username",
            iconData: Icons.person_outline_rounded,
            labeltext: "Username",
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            mycontroller: controller.email,
            hinttext: "Enter Your Email",
            iconData: Icons.email_outlined,
            labeltext: "Email",
          ),
          CustonTextFormAuth(
            mycontroller: controller.password,
            hinttext: "Enter Your Password",
            iconData: Icons.lock_outline,
            labeltext: "Password",
          ),
          CustomButtomAuth(
              text: "Sign up",
              onPressed: () {
                controller.creataccount();
              }),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '-or sign up with-',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Rowsocil(),
          const SizedBox(height: 5),
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
    );
  }
}
