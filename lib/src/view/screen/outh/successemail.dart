import 'package:ecomerca/core/constant/app_color.dart';

import 'package:ecomerca/src/view/screen/outh/login.dart';
import 'package:ecomerca/src/view/widget/outh/custombuttonauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Successemail extends StatelessWidget {
  const Successemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
        title: const Text(
          'Success',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const Icon(
            Icons.check_circle_outline,
            color: AppColor.darkOrange,
            size: 160,
          ),
          CustomButtomAuth(
              text: "login",
              onPressed: () {
                Get.off(const Login());
              }),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
