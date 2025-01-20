import 'package:ecomerca/core/constant/apploti.dart';
import 'package:ecomerca/src/controller/favorticontroler.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


// ignore: must_be_immutable
class ProductCard extends GetWidget<FavoriteController> {
  final String name;
  final String price;
  final String image;

  void Function()? onTap;

  // ignore: use_key_in_widget_constructors
  ProductCard(
      {required this.name, required this.price,required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap
      // عند النقر على المنتج، يمكن الانتقال إلى صفحة تفاصيل المنتج

      ,
      child: SizedBox(
        child: SizedBox(
          child:  Stack(
              children: [
                Container( decoration: BoxDecoration(  borderRadius: BorderRadius.circular(10),
                   border: Border.all( color: Colors.black ,)),
                  child: Card(// color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                image, 
                                errorBuilder: (context, error, stackTrace) {
                                  return CircularProgressIndicator() ;
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center( 
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes !=
                                           null?loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1):null
                                     ),
                                    );
                                  }
                                },
                                fit: BoxFit.contain,
                                width: double.infinity,
                                height: 120,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            name,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            ('$price EGP'),
                            style: const TextStyle(fontSize: 14, color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                   // left: 80,
                    right: 20,
                    top: 260,
                    bottom: 5, 
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Map<String, String> favoriteItem = {
                          'name': name,
                           'image': image,
                          'description': price,
                        };
                        controller
                            .addItemToFavorite(favoriteItem); // إضافة إلى المفضلة
                        Get.snackbar('Success', 'Item added to favorites!',
                            colorText: Colors.white);
                      },
                      child: Container( 
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: const BoxDecoration(
                          color: Colors.transparent ,
                          borderRadius:
                              BorderRadiusDirectional.all(Radius.circular(20)),
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  color: Color.fromARGB(255, 240, 1, 1))),
                          // Border(
                          //    bottom: BorderSide(color: Colors.red),
                          //    ),
                        ),
                        child: Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [ 

                            const Text(
                              // textAlign: TextAlign.center,
                              'add ',
                              style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.black ,fontSize: 15
                              ),
                            ), 
                            Lottie.asset(Apploti.addfavorit ,)
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          
        ),
      ),
    );
  }
}
