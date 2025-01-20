import 'package:ecomerca/core/constant/app_color.dart';
import 'package:ecomerca/core/constant/imdasset.dart';
import 'package:ecomerca/src/controller/cartcontroler.dart';
import 'package:ecomerca/src/view/screen/checkout/checoutt.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';



class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar( 
          flexibleSpace: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors:  [
              Color.fromARGB(255, 16, 0, 247) , 
                  
               Color.fromARGB(255, 85, 151, 244)
              ], // الألوان المفضلة
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title:  Text(
            'My Cart',
            style:GoogleFonts.aboreto(  
            fontSize: 20 ,
          color: Colors.white , 
          fontWeight: FontWeight.bold
          
          
          )
          ),
          backgroundColor: AppColor.darkGrey,
        
        ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return  Center(child:Image.asset(AppImageAsset.onBoardingImageThree));
        } 
      
        return Column(
          children: [
            // قائمة العناصر في العربة
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return Card( 
                    elevation: 5, 

                    child: ListTile( 
                      leading: Image.network(item.image), 
                      
                      title: Text(item.name ,style:const TextStyle( fontSize: 10),),
                      subtitle:
                           Text('${item.price.toString()} x ${item.quantity}') ,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon:const Icon(Icons.remove ,),
                            onPressed: () {
                              if (item.quantity > 1) {
                                item.quantity--; // تقليل الكمية
                              } else {
                                cartController.removeFromCart(
                                    item); // حذف العنصر إذا كانت الكمية 1
                              }
                              cartController.cartItems.refresh(); // تحديث العربة
                            },
                          ),
                          IconButton(
                            icon:const Icon(Icons.add),
                            onPressed: () {
                              item.quantity++; // زيادة الكمية
                              cartController.cartItems.refresh(); // تحديث العربة
                            },
                          ),
                          IconButton(
                            icon:const Icon(Icons.delete ,color: Colors.red,), // أيقونة الحذف
                            onPressed: () {
                              cartController.removeFromCart(item); // حذف العنصر
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // عرض الإجمالي
            Container( margin:const EdgeInsets.only( bottom: 10),
              decoration:
                  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), 
                    border: Border.all(color: Colors.black)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Text(
                      'Total: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Obx(() => Text(
                          '${cartController.totalPrice.toStringAsFixed(2)} ', // عرض الإجمالي
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        )),
                    const Text(
                      'EGP',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 242, 118, 2)),
                    ),const Spacer() ,
                
                  
                     InkWell( 
                      onTap: () { 
                        
                            QuickAlert.show(
            context: context,
            widget: const Icon(
              Icons.send,
              size: 26,
              color: Colors.blue,
            ), 
            
            type: QuickAlertType.info,
            text: ' Total amount ${cartController.totalPrice.toStringAsFixed(2)} \n Do you want to complete the purchase',

          
            title: ' check out',
            onConfirmBtnTap: () {
               Get.to(Checoutt( data:cartController.cartItems ,totall:cartController.totalPrice.toStringAsFixed(2) ,)) ;
           
            });
                      },
                      child: Container(  padding:const EdgeInsets.all(5),
                         decoration:const BoxDecoration(  
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                         gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                      Color.fromARGB(248, 29, 14, 1), // اللون الأول
                                        // اللون الثاني
                      Color.fromARGB(255, 218, 25, 0), // اللون الثالث
                                        ],
                                      ),
                      ),
                        child: const Row(
                          children: [
                            Icon(Icons.shopping_cart ,color: Colors.white,), 
                            Text('check out' ,style: TextStyle( color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                          ],
                        ), 
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    
    );
  }
}
