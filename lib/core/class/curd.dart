import 'dart:convert';


import 'package:http/http.dart' as http;

class Crud {  
  //funcation get ===================
  getrspons(
    String url,
  ) async {
    try {
      var response = await http.get(
        Uri.parse(url),
      ); 
      if(response.statusCode == 200){ 
             var responsebody = jsonDecode(response.body); 
             return responsebody ;
      } else{ 
      //  print('Error ${response.statusCode}') ;
      }
    } catch (a) { 
     // print('Error catch  $a  =========') ; 
       } 
  }    
  //funcation post ============================
   postrespons(
    String url, Map data
  ) async {
    try {
      var response = await http.post(
        Uri.parse(url), body: data 
      ); 
      if(response.statusCode == 200){ 
             var responsebody = jsonDecode(response.body); 
             return responsebody ;
      } else{ 
   //     print('Error ${response.statusCode}') ;
      }
    } catch (a) { 
     // print('Error catch $a =========') ;  
     } 
  } 





} 
 
 


