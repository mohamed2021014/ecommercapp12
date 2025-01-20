import 'package:ecomerca/core/constant/app_color.dart';
import 'package:ecomerca/src/controller/carcarecontroler.dart';


import 'package:ecomerca/src/view/screen/prudictdetils.dart';
import 'package:ecomerca/src/view/widget/prudictcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Carcare extends StatelessWidget {
  const Carcare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( flexibleSpace: Container( decoration:const BoxDecoration( 
        gradient: LinearGradient(colors: [ 
           Color.fromARGB(255, 16, 0, 247) , 
                  
               Color.fromARGB(255, 85, 151, 244)
        ])
      ),),
         iconTheme:const IconThemeData( color: Colors.white),
         backgroundColor: AppColor.darkGrey,
        title: const Text(
          'Carcare',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,color: Colors.white),
        ),
      ), body:Container( padding: const EdgeInsets.all(8), 
      
      child:   GetBuilder<Carcarecontroler>( 
        init: Carcarecontroler(),builder: (controller) => 
         GridView.builder(
                      shrinkWrap: true,
                     // physics:const NeverScrollableScrollPhysics(),
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount( mainAxisExtent: 300,
                        crossAxisCount: 2, // عدد الأعمدة
                        crossAxisSpacing: 8.0, // المسافة بين الأعمدة
                        mainAxisSpacing: 10, // المسافة بين الصفوف
                       // childAspectRatio: 0.5, // نسبة عرض العنصر إلى ارتفاعه
                      ),
                      itemCount: controller.carcare.length ,
                      itemBuilder: (context, index) {
                        return ProductCard( 
                          onTap: () {  
                                Get.to((Prudictdetils( dataa:controller.carcare[index] ,)));
                               index =index ;
                      
                          },
                          name: controller.carcare[index]['name'] ,
                          price:controller.carcare[index]['price'] ,
                         image: controller.carcare[index]['image'] 
                        );
                      },
                    ),
      ), ),
    );
  }
}