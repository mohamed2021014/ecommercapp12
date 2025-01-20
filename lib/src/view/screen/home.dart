// ignore_for_file: prefer_const_constructors

import 'package:ecomerca/src/controller/cartcontroler.dart';


import 'package:ecomerca/src/view/screen/cart.dart';
import 'package:ecomerca/src/view/screen/drawer/drawe.dart';
import 'package:ecomerca/src/view/screen/favorit.dart';
import 'package:ecomerca/src/view/screen/homescrren.dart';

import 'package:ecomerca/src/view/widget/bottomnavigationbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget{
   const Home({super.key});
    
  @override
  Widget build(BuildContext context) { 
   
    // ignore: no_leading_underscores_for_local_identifiers, non_constant_identifier_names
    GlobalKey<ScaffoldState> _Scaffoldd =GlobalKey<ScaffoldState>();
    final List<Widget> screens = [Homescrren(_Scaffoldd ), FavoritePage(), CartPage()]; 
     
 
    return
     Scaffold(   
   key: _Scaffoldd, 
         drawer: Drawer( child:Drawerr() , ),
          bottomNavigationBar: Container(  
             height: 60,
             color: Colors.transparent,
            child:   bottomNavigationBar()
 ,),
  
          //======================================================= =================
          body: GetBuilder<CartController>( 
            init: CartController(), 
            builder: (controller) => 
            Container( 
              child:  screens[controller.slectedind]),
          )
    );
}  

}
