import 'dart:io';
import 'package:ecomerca/core/constant/app_color.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: 'Exit',
      titleStyle:const  TextStyle(color: AppColor.darkOrange , fontWeight: FontWeight.bold),
      middleText: 'are you shour',
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    // ignore: deprecated_member_use
                    MaterialStateProperty.all(AppColor.darkOrange)),
            onPressed: () {
              exit(0);
            },
            child:const Text("ok")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    // ignore: deprecated_member_use
                    MaterialStateProperty.all(AppColor.darkOrange)),
            onPressed: () {
              Get.back();
            },
            child:const Text("cancel"))
      ]);
  return Future.value(true);
}