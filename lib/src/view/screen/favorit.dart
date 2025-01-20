import 'package:ecomerca/core/constant/app_color.dart';
import 'package:ecomerca/core/constant/apploti.dart';
import 'package:ecomerca/src/controller/favorticontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());

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
            'My Favorit',
             style:GoogleFonts.aboreto(  
            fontSize: 20 ,
          color: Colors.white , 
          fontWeight: FontWeight.bold
          
          
          ) )  ,
          backgroundColor: AppColor.darkGrey,
        
        ),
      body: Obx(() {
        return favoriteController.favoriteItems.isEmpty
            ? Center(child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [  
              Lottie.asset(Apploti.favorit) ,
           const   Text(' Favorit is Empty....')
            ],))
            : ListView.builder(
                itemCount: favoriteController.favoriteItems.length,
                itemBuilder: (context, index) {
                  var item = favoriteController.favoriteItems[index];
                  return ListTile(
                   leading: Image.network(item['image']!),
                    title: Text(item['name']!),
                    subtitle: Text('${ item['description']!} EGP'),
                    trailing: IconButton(
                      icon:const Icon(Icons.delete, color: Color.fromARGB(255, 227, 12, 12)),
                      onPressed: () {
                        favoriteController.removeItemFromFavorite(index); // إزالة من المفضلة
                      },
                    ),
                  );
                },
              );
      }),
    );
  }
}