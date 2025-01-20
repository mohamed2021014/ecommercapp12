import 'package:ecomerca/core/constant/app_color.dart';
import 'package:ecomerca/core/constant/apploti.dart';
import 'package:ecomerca/data/datasource/static/static.dart';
import 'package:ecomerca/src/controller/outh/onboarding_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  // ignore: use_super_parameters
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(onBoardingList[i].title!,
                    style: GoogleFonts.aboreto( 
                      fontWeight: FontWeight.bold
                    ) ),
                const SizedBox(height: 30),
                i == 0
                    ? Container(
                        decoration: const BoxDecoration(),
                        height: 250,
                        child: Lottie.asset(
                         Apploti.on1,
                        ))
                    : i == 1
                        ? Container(
                            decoration: const BoxDecoration(),
                            height: 250,
                            child: Lottie.asset(Apploti.on2))
                        : i == 2
                            ? 
                           Lottie.asset(Apploti.on3 ,width: 300)
                            :i==3 ?Lottie.asset(Apploti.on4 ,width: 300)
                            : Image.asset(
                                onBoardingList[i].image!,
                                width: 200,
                                height: 230,
                                fit: BoxFit.fill,
                              ),
                const SizedBox(height: 80),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          color: AppColor.darkGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
              ],
            ));
  }
}
