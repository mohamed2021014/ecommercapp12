import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checoutcontroler extends GetxController { 

  // المتغير الذي سيحتفظ بالقيمة المختارة
  RxString selectedOption = ''.obs; 
  int selectindex =0 ;   
 late PageController pageController ;
  increment(){  
    selectindex++ ;  
     pageController.animateToPage(selectindex,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    update() ;
  } 
  onshange(int val){  
    selectindex=val ; 
    update() ;

  }

  // دالة للتحقق إذا كان تم اختيار شيء أم لا
  bool get isOptionSelected => selectedOption.value.isNotEmpty; 
  @override
  void onInit() {
 onshange ; 
 pageController =PageController() ;
    super.onInit();
  }
}