import 'package:ecomerca/src/controller/checoutcontroler.dart';
import 'package:ecomerca/src/view/screen/checkout/mail.dart';
import 'package:ecomerca/src/view/screen/checkout/summary.dart';
import 'package:ecomerca/src/view/screen/checkout/bag.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checoutt extends StatelessWidget {
  const Checoutt({super.key, this.data, this.totall}); 
 // ignore: prefer_typing_uninitialized_variables
 final data ;
// ignore: prefer_typing_uninitialized_variables
final totall ;
  @override
  Widget build(BuildContext context) {
    List num = [1, 2, 3];
    List<Widget> chek = [ Summary( dataa: data ,total: totall,),const Checoutt1(), Mail(total:totall  )];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Color.fromARGB(250, 6, 34, 249), // اللون الأول
            //     Color.fromARGB(234, 223, 223, 223), // اللون الثاني
            //     Color.fromARGB(255, 242, 243, 240), // اللون الثالث
            //   ],
            // ),
            ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                const Positioned.fill(
                      child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  )),
                  GetBuilder<Checoutcontroler>(
                    init: Checoutcontroler(),
                    builder: (controller) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          3,
                          (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 600),
                              padding:const EdgeInsets.all(5),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius:
                                            controller.selectindex == index
                                                ? 5
                                                : 0)
                                  ],
                                  color: controller.selectindex == index
                                      ? const Color.fromARGB(255, 8, 26, 231)
                                      : const Color.fromARGB(255, 39, 37, 37),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "${num[index]} ",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 600,
                child: GetBuilder<Checoutcontroler>(
                  init: Checoutcontroler(),
                  builder: (controller) => PageView(
                    controller: controller.pageController,
                    onPageChanged: (value) {
                      controller.onshange(value);
                    },
                    children: List.generate(
                      3,
                      (index) => SizedBox(
                        child: chek[index],
                      ),
                    ),
                  ),
                ),
              ),
              GetBuilder<Checoutcontroler>(
                init: Checoutcontroler(),
                builder: (controller) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 100,
                    child: MaterialButton(
                        color: controller.selectindex==2 ? Colors.black45:Colors.blue,
                         onPressed: () { 
                          if(controller.selectindex==0 ||controller.selectindex==1
                          ){
                          controller.increment();}
                        },
                        child: const Row(
                          children: [
                            Text('next '),
                            Icon(Icons.arrow_forward_outlined)
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
