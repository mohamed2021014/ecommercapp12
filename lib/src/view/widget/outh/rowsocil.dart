
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Rowsocil extends StatelessWidget {
  final void Function()? onTapgoogle;
  final void Function()? onTapfeacbook;
  const Rowsocil({super.key, this.onTapgoogle, this.onTapfeacbook});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTapgoogle,
          child:  Card(
            color: Colors.white,
            child: Padding(
              padding:const EdgeInsets.only(left: 15,right: 3),
              child: Center(
                child: Row(
                  children: [
                 const   Text(
                      'login with google',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox( height: 50,
                      child: Lottie.network(
                          'https://lottie.host/516b5c35-2652-48c9-9fcc-2e9efc26197f/17d1ojibH3.json'),
                    )
                  ],
                ),
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
    );
  }
}
