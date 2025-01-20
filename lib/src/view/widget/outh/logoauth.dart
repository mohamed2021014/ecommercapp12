import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key, this.titl, this.imge});
  final String? titl;
  final String? imge;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(),
        height: 250,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
                alignment: Alignment.topCenter, child: Lottie.asset(imge! , 
             
                
                )),
            Positioned.fill(
                child: Text(
              titl!,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
