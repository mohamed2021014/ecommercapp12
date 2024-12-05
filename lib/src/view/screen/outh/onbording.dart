


import 'package:ecomerca/src/controller/outh/onboarding_controller.dart';
import 'package:ecomerca/src/view/widget/onbording/custombutton.dart';
import 'package:ecomerca/src/view/widget/onbording/customslider.dart';
import 'package:ecomerca/src/view/widget/onbording/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {

  // ignore: use_super_parameters
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ; 
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children:[
               CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}