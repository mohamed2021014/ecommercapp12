import 'package:ecomerca/src/controller/homscrencontrol.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cardsearch extends StatelessWidget {
  const Cardsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homscrencontrol>(
      init: Homscrencontrol(),
      builder: (controller) => const Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '   search for what you want..',
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
