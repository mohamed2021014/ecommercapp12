

import 'package:ecomerca/core/constant/app_color.dart';
import 'package:ecomerca/data/datasource/static/static.dart';
import 'package:ecomerca/src/controller/outh/onboarding_controller.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomDotControllerOnBoarding extends StatelessWidget {

  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primrecolor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}