import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: 200,
              child: Image.network(
                  "https://iili.io/2rTLGJR.png" 
                  ,errorBuilder: (context, error, stackTrace) {
                  return  Container(child: Text('$error'),) ;
                  },))
        ],
      ),
    );
  }
}
