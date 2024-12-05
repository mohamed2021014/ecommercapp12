
import 'package:ecomerca/core/constant/app_color.dart';


import 'package:ecomerca/src/controller/outh/onboarding_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomButtonOnBoarding extends GetWidget<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});





 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next() ; 
          },
          color: AppColor. primrecolor,
          child: const Text("Continue")),
    );
  }
}