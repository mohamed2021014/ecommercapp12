
import 'package:ecomerca/core/constant/imdasset.dart';

import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key, this.titl}); 
  final String? titl ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
       decoration:const BoxDecoration( ),
        height: 250,
        width: double.infinity,
        child: Stack(
          children: [
           
                
                   Container( alignment: Alignment.topCenter,
                     child: Image.asset(
                        AppImageAsset.logo,fit: BoxFit.cover,
                                   
                      ),
                   ),
                  
                
              const  Positioned.fill( 
                  top: 177,
                  child:  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Auto',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        ' Express',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromARGB(255, 3, 93, 249)),
                      )
                    ],
                  ),
                ) , 
               Positioned.fill(child: Text( titl! ,style:const TextStyle( fontSize: 30,fontWeight: FontWeight.bold),)
                )
            
          ],
        ),
      ),
    );
  }
}
