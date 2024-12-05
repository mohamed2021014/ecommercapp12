

import 'package:ecomerca/src/controller/outh/login_controller.dart';
import 'package:ecomerca/src/controller/outh/sinupcontroler.dart';
import 'package:get/get.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sinupcontrolerImp(),fenix: true
    );
  
    Get.lazyPut(() => LoginControllerImp(),fenix: true); 

  }
}
