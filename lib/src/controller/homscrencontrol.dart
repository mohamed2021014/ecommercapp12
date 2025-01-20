import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:http/http.dart' as http;
import 'package:ecomerca/core/constant/linkapi.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Homscrencontrol extends GetxController {
  List data = [];
  List filteredData = [];
  var imge ;
  final ImagePicker paicker =ImagePicker()   ; 
  //photo
img()async{  
  final XFile? photo = await paicker.pickImage(source: ImageSource.camera);
  
if(photo!= null ){ 
  imge =File(photo.path) ; 
  update() ;
 }else{}
 }
galty()async{  
  final XFile? photo = await paicker.pickImage(source: ImageSource.gallery);
  
if(photo!= null ){ 
  imge =File(photo.path) ; 
  update() ;
 }else{}
 }


 // search
  void filterSearchResults(String query) {
    if (query.isEmpty) {
      filteredData = data;
      update();
    } else {
      filteredData = data
          .where((item) =>
              item['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();

      update();
    }
  }
 // url view api
  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse(viewlink));

    if (response.statusCode == 200) {
    //  print(response.body);

      data = jsonDecode(response.body);
      update();
    } else {
      throw Exception('Failed to load users');
    }
  }

  datataa() {
    // print('$  ================') ;
  }
  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
       
          // ignore: avoid_print
          print(' User is currently signed out!=============================');
      
      } else {
        
          // ignore: avoid_print
          print('User is signed in!===================================');
   
      }
    });
    fetchUsers();
    super.onInit();

    filteredData = data;
    datataa();
  }
}
