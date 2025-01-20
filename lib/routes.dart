

import 'package:ecomerca/core/constant/routes.dart';
import 'package:ecomerca/src/view/screen/home.dart';

import 'package:ecomerca/src/view/screen/outh/login.dart';
import 'package:ecomerca/src/view/screen/outh/signup.dart';


import 'package:get/get.dart';
 
 List<GetPage<dynamic>>? getPages =[  
   /*GetPage(name: "/", page: () => const OnBoarding() , middlewares: [
    MyMiddleWare()
  ]),*/
   GetPage(name:AppRoute.login , page:() =>const  Login() ) , 
      GetPage(name:AppRoute.Signup , page:() =>  Signup() ) , 
            GetPage(name:AppRoute.home , page:() =>  const Home() ) , 
 ] ;



