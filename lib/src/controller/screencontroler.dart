import 'dart:convert';

import 'package:ecomerca/core/constant/linkapi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class Screencontroler extends GetxController{ 
  
  List datascreen =[] ; 
  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse(screenkink));

    if (response.statusCode == 200) { 
    //  print(response.body) ;
     
       datascreen=jsonDecode(response.body) ; 
       update() ;
     
    } else {
      throw Exception('Failed to load users');
    }
  }  
  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }
}
