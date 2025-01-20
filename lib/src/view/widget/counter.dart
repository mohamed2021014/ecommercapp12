import 'package:ecomerca/src/controller/cartcontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counter extends StatelessWidget { 

 
 
 
   const Counter({super.key });

  @override
  Widget build(BuildContext context) {
    return  Container(  
      //padding: EdgeInsets.all(1),
      decoration:const BoxDecoration(
       // border: Border.all(color: Colors.grey, width: 1),
      //  borderRadius: BorderRadius.circular(2),
      ),
      child: GetBuilder<CartController>( 
        init: CartController(),
        builder: (controller) => 
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove, color: Colors.red),
              onPressed: (){}
              // controller.dicrmentconter();
              
            ),
            const Text(
               '0',  // عرض الرقم هنا
              style:TextStyle(fontSize: 24),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.green),
              onPressed:(){}
            ),
          ],
        ),
      ) );
  }
}