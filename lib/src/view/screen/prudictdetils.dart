import 'package:ecomerca/core/constant/app_color.dart';

import 'package:ecomerca/src/controller/cartcontroler.dart';
import 'package:ecomerca/src/model/cartshredpref.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Prudictdetils extends StatelessWidget {
  final String? imageUrl;
  // ignore: prefer_typing_uninitialized_variables
  final dataa;
  Prudictdetils({super.key, this.imageUrl, this.dataa});
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: AppColor.darkGrey,
        title:  Text(
          'Product Details',
           style:GoogleFonts.aboreto(  
            fontSize: 20 ,
          color: Colors.white , 
          fontWeight: FontWeight.bold
          
          
          )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          /*  Map<String, String> newItem = {
            'name': dataa['name'],
            'image': dataa['image'],
            'description': dataa['price'],
          };
          controller.addItemToCart(newItem); //   ضاف
        */
          double str = double.parse(dataa['price']);
          CartItem item =
              CartItem(name: dataa['name'], image: dataa['image'], price: str);
          cartController.addToCart(item);

          Get.snackbar('Success', 'Item added to cart!',
              colorText: Colors.white);
        },
        label: const Text('Add to Cart'),
        icon: const Icon(Icons.shopping_cart),
      ),
      body: ListView(
        children: [
          // Product image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: 300,
                child: Image.network(
                  dataa['image'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
             RatingBar.builder(
   initialRating: 3,
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding:const EdgeInsets.symmetric(horizontal: 4.0),
   itemBuilder: (context, _) =>const Icon(
     Icons.star,
     color: Colors.amber,
   ),
   onRatingUpdate: (rating) {
   //  print(rating);
   },
) ,
          // Product title
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' title :  ${dataa['name']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
          // Product price
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Price : ${dataa['price']} EGP',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),

          // Product description
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' DEC... \n ${dataa['dec']}  ',
                    style:const TextStyle(fontSize: 10),
                  ),
                ),
              )),

          // Product price

          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
