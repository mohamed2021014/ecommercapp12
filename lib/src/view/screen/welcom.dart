import 'package:ecomerca/core/constant/apploti.dart';
import 'package:ecomerca/src/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedTextPage extends StatefulWidget {
  const AnimatedTextPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedTextPageState createState() => _AnimatedTextPageState();
}

class _AnimatedTextPageState extends State<AnimatedTextPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>  const Home(),
        ));
        // بعد انتهاء الرسوم المتحركة، يمكنك تنفيذ أي عمل آخر
        //   print('الرسوم المتحركة انتهت');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration( 
            gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(248, 65, 84, 232), // اللون الأول
                    Color.fromARGB(234, 224, 219, 219), // اللون الثاني
                    Color.fromARGB(255, 231, 107, 107), // اللون الثالث
                  ],
                ),
        ) ,
          
        child: Center(
          child: Column( crossAxisAlignment: CrossAxisAlignment.center,
            children: [  
              Lottie.asset(Apploti.mator) ,
              FadeTransition(
                opacity: _opacityAnimation,
                child: const Text(
                  '          welcom \n AUTO EXPRESS\n MAINTENNACE ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                   color: Colors.black,
                    shadows: [
                      Shadow(
                        blurRadius: 17,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
