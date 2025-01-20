import 'package:ecomerca/core/constant/apploti.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Imghome extends StatelessWidget {
  const Imghome({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(  alignment: Alignment.center,
                height: 200,width: 400, 
                
                decoration: BoxDecoration(
                  /*  image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/Picsart_24-12-10_05-36-25-666.jpg')),*/ 
                 
                    borderRadius: BorderRadius.circular(50)), 
                      child: Lottie.asset(Apploti.home2 ,),
              ) ;
  }
}