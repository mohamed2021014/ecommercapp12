
import 'package:ecomerca/data/datasource/static/static.dart';
import 'package:ecomerca/src/view/screen/catocaries/carcare.dart';
import 'package:ecomerca/src/view/screen/catocaries/screen.dart';
import 'package:ecomerca/src/view/screen/catocaries/sparbarts.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Rowcatocaris extends StatelessWidget {
  const Rowcatocaris({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            catocaris.length,
            (index) => InkWell(
                  onTap: () {
                    if (index == 1) {
                      Get.to(const Screen());
                    } else if (index == 0) {
                       Get.to(const Spabarts()) ;
                    } else if( index==2){ 
                      Get.to(const Carcare()) ;
                    }
                  },
                  child: Container(  
                    margin:const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Card(
                      // color: Colors.transparent,

                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 40,
                                child: Image.asset(
                                  catocaris[index].image,
                                  color: Colors.black,
                                  //  color: const Color.fromARGB(
                                  //    255, 255, 170, 59),
                                )),
                            Text(
                              catocaris[index].text,
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
