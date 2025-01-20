import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../../controller/cartcontroler.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => MoltenBottomNavigationBar(
        domeCircleColor: const Color.fromARGB(0, 20, 19, 19),
        borderColor: const Color.fromARGB(255, 0, 0, 0),

        barHeight: 50,
        domeHeight: 10,
        duration: const Duration(milliseconds: 500),
        borderSize: 1,
      
        selectedIndex: controller.slectedind,
        onTabChange: (clickedIndex) {
          controller.changeindexnavigator(clickedIndex);
        },
        tabs: [
          MoltenTab(
       unselectedColor: Colors.black,
            icon: const Icon(Icons.home_outlined),
          ),
          MoltenTab( 
              unselectedColor: Colors.black,
            icon: const Icon(Icons.favorite_border),
          ),
          MoltenTab( 
              unselectedColor: Colors.black,
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      /*
       BottomNavigationBar(  
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(size: 25),
        iconSize: 20,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white70, 
         selectedItemColor: Colors.white, 
          showUnselectedLabels: false, // إخفاء النصوص غير المختارة
            type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
           //   backgroundColor: AppColor.darkGrey,
              icon: Icon(
                Icons.home,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'favorit'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.card_travel
                ,
              //  size: 27,
                color: Colors.white,
              ),
              label: 'cart'),
        ],
        currentIndex: controller.slectedind,
        onTap: (value) {
          controller.changeindexnavigator(value);
        },
      ), */
    );
  }
}
