// ignore_for_file: prefer_const_constructors
import 'package:ecomerca/core/constant/app_color.dart';
import 'package:ecomerca/core/constant/apploti.dart';
import 'package:ecomerca/src/controller/homscrencontrol.dart';
import 'package:ecomerca/src/view/screen/checkout/nativaction.dart';
import 'package:ecomerca/src/view/screen/prudictdetils.dart';
import 'package:ecomerca/src/view/widget/cardsearch.dart';
import 'package:ecomerca/src/view/widget/imghome.dart';
import 'package:ecomerca/src/view/widget/prudictcart.dart';
import 'package:ecomerca/src/view/widget/rowcatocaris.dart';
import 'package:ecomerca/src/view/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Homescrren extends GetWidget<Homscrencontrol> {
  const Homescrren(this.scfolldd, {super.key});
  // ignore: prefer_typing_uninitialized_variables
  final scfolldd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              scfolldd.currentState?.openDrawer();
              //  homscrencontrol.Scaffoldkey.currentState?.openDrawer();
              //  controller.
              //  controller.keyy(contextt) ;
            },
            icon: Icon(Icons.view_list)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color.fromARGB(255, 16, 0, 247),

                Color.fromARGB(255, 85, 151, 244)
                // Color.fromARGB(255, 240, 17, 1),
                // Colors.black
              ], // الألوان المفضلة
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text('home',
            style: GoogleFonts.aboreto(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        actions: [
          InkWell(
              onTap: () {
                Get.to(Nativaction());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Badge(
                    smallSize: 10,
                    largeSize: 0,
                    alignment: Alignment(2, -1.5),
                    child: Icon(Icons.notifications_active_outlined)),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                //22222 Widget  card ================================
                InkWell(
                    onTap: () {
                      showSearch(
                          context: context,
                          delegate: DataSearch(dataa: controller.data));
                    },
                    child: Cardsearch()),

                //3333333333333333333333 widget
                Imghome(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Sections',
                  style: TextStyle(
                      color: AppColor.darkGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                //44444444444444444444 widget
                Stack(
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Rowcatocaris(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8 ,bottom: 10,top: 10),
                          child: Text(
                            'Best seller ',
                            style: GoogleFonts.aboreto(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ), 
                       
                      ],
                    ), 
                      Positioned(
                        top: 80,
                       left: 269,
                        child: SizedBox(
                         height: 80,
                            child: Lottie.asset(Apploti.sles,
                                fit: BoxFit.contain)),
                      ),
                  ],
                ),
            
                //5555555555 widget

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<Homscrencontrol>(
                    init: Homscrencontrol(),
                    builder: (controller) => GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 10,
                          // childAspectRatio: 0,
                          mainAxisExtent: 300),
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          onTap: () {
                            index = index;
                            Get.to((Prudictdetils(
                              dataa: controller.data[index],
                            )));
                          },
                          name: controller.data[index]['name']!,
                          price: controller.data[index]['price']!,
                          image: controller.data[index]['image']!,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
