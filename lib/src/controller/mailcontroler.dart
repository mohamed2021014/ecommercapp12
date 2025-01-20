import 'package:ecomerca/core/class/curd.dart';
import 'package:ecomerca/core/constant/apploti.dart';
import 'package:ecomerca/core/constant/linkapi.dart';
import 'package:ecomerca/src/controller/Nativacontrol.dart';
import 'package:ecomerca/src/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';

class Mailcontroler extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  final Crud _crud = Crud(); 
    Nativacontrol nativacontrol =Get.put(Nativacontrol() ) ; 
final List<String> genderItems = [
" Al Sharqia	" ,
"Alexandria	",
"Aswan	",
"Asyut	",
"Beheira	",
"Beni Suef	",
"Cairo	",
"Dakahlia	",
"Damietta	",
"Faiyum	",
"Gharbia	",
"Giza	",
"Ismailia",	
"Kafr el-Sheikh	",
"Luxor	",
"Matrouh	",
"Minya",
"Monufia",
"New Valley	",
"North Sinai",
"Port Said",
"Qalyubia",
"Qena	",
"Red Sea	",
"Sohag	",
"South Sinai",
"Suez",
];

  // ignore: non_constant_identifier_names
  Sendmail(context ,total) async {
    if (formstate.currentState!.validate()) { 
      formstate.currentState!.save();
      var response = await _crud.postrespons(maillink,
          {"name": name.text, "email": email.text, "phone": phone.text}); 
              Map<String, String> nati = {
                          'name': "$total",
                            "description" :""  ,
                            "image" : "" 
                        };
                        nativacontrol
                            .addItemToFavorite(nati); 
      if (response['status'] == "sucsses") {
        QuickAlert.show( 
            context: context,
            widget: Lottie.asset(Apploti.Sendmail),
            type: QuickAlertType.success,
            text: 'You will be answered within 24 hours thank you.',
            barrierDismissible: false,
            title: 'succeed',
            onConfirmBtnTap: () {
              Get.offAll(const Home());
            });
      } else {
        // ignore: avoid_print
        print('Erorrrrrrrrrrrrrrrrrrrrr');
      }
    } else {}
  }
}
