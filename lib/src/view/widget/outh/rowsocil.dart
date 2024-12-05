
import 'package:ecomerca/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class Rowsocil extends StatelessWidget { 
  final void Function()? onTapgoogle ;
 final void Function()? onTapfeacbook ;
  const Rowsocil({super.key, this.onTapgoogle, this.onTapfeacbook});

  @override
  Widget build(BuildContext context) {
    return  Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(onTap:onTapgoogle ,
                      
                    
                      child:const Card( color: Colors.white, 
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                            child: Row(
                              children: [   Text('Sign in with google' , style: TextStyle( fontSize: 20),),
                                Icon(
                                  Icons.g_mobiledata_rounded,
                                  size: 30, color: AppColor.primrecolor,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ),
                    /* InkWell( onTap: onTapfeacbook,
                       child:const Card( color: Colors.white, 
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                            child: Row(
                              children: [Text('facebook' , style: TextStyle( fontSize: 20),),
                                Icon(
                                  Icons.facebook,
                                  size: 30, color: AppColor.primrecolor,
                                ),
                              ],
                            ),
                          ),
                        ),
                     ), */
                    
                  ],
    ) ;
  }
}