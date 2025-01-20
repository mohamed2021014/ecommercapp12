import 'package:ecomerca/src/controller/Nativacontrol.dart';
import 'package:ecomerca/src/controller/cartcontroler.dart';
import 'package:ecomerca/src/controller/favorticontroler.dart';
import 'package:ecomerca/src/controller/homscrencontrol.dart';
import 'package:ecomerca/src/controller/mailcontroler.dart';
import 'package:ecomerca/src/controller/outh/login_controller.dart';
import 'package:ecomerca/src/controller/outh/sinupcontroler.dart';
import 'package:get/get.dart';
class Binding extends Bindings {  
  @override
  void dependencies() {
    Get.lazyPut(() => sinupcontrolerImp(), fenix: true);

    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    //  Get.lazyPut(() => Homecontroler(),fenix: true);
    Get.put(
      () => CartController(),
    );
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(
      () => Homscrencontrol(),
    );
    Get.lazyPut(() => Mailcontroler(), fenix: true); 
      Get.lazyPut(() => Nativacontrol(), fenix: true);
  }
}
