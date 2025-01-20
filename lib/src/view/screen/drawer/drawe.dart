import 'package:ecomerca/core/constant/apploti.dart';
import 'package:ecomerca/main.dart';
import 'package:ecomerca/src/controller/homscrencontrol.dart';
import 'package:ecomerca/src/controller/outh/sinupcontroler.dart';
import 'package:ecomerca/src/view/screen/checkout/nativaction.dart';
import 'package:ecomerca/src/view/screen/drawer/setting.dart';
import 'package:ecomerca/src/view/screen/outh/login.dart';
import 'package:ecomerca/src/view/widget/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class Drawerr extends StatelessWidget {
  Drawerr({super.key});
  Homscrencontrol homscrencontrol = Get.put(Homscrencontrol());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // User Account Header
            GetBuilder<sinupcontrolerImp>(
              init: sinupcontrolerImp(),
              builder: (controller) => UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 19, 83, 233),

                    Color.fromARGB(255, 36, 69, 235)
                    //            Color.fromARGB(255, 232, 23, 8), Colors.black
                  ]),
                  // Blue header background
                  borderRadius: BorderRadius.only(),
                ),
                accountName: Text(
                  controller.user!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(controller.em!),
                currentAccountPicture: const photo(),
              ),
            ), 
            Container(  
              decoration: BoxDecoration( 
                ),
             child: Stack(
               children: [
                 Column(children: [ 
                    listile(
                  onTapp: () {
                    // Get.back();
                    Get.back();
                  },
                  leading: const Icon(Icons.home, color: Colors.blue),
                  title: const Text('Home', style: TextStyle(color: Colors.black)),
                             ),
                             listile(
                  onTapp: () {
                    showSearch(
                        context: context,
                        delegate: DataSearch(dataa: homscrencontrol.data));
                  },
                  leading: const Icon(Icons.search, color: Colors.blue),
                  title:
                      const Text('Search', style: TextStyle(color: Colors.black)),
                             ),
                 listile( onTapp: () {
                  Get.to(const Nativaction()) ;
                             },
                  leading: Icon(Icons.notifications, color: Colors.blue),
                  title:
                      Text('Notifications', style: TextStyle(color: Colors.black)),
                             ),
                             listile(
                  onTapp: () {
                    Get.to(const SettingsPage());
                  },
                  leading: const Icon(Icons.settings, color: Colors.blue),
                  title:
                      const Text('Settings', style: TextStyle(color: Colors.black)),
                             ),
                             //  const Divider(color: Colors.black),
                             listile(
                  onTapp: () {
                    _showLogoutDialog(context);
                  },
                  leading: const Icon(Icons.exit_to_app, color: Colors.blue),
                  title: const Text('Logout', style: TextStyle(color: Colors.red)), 

                             ) ,
                         Lottie.asset(Apploti.car)
                 ],), 
                 
                 
               ],
             ),
            ),
           
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class photo extends StatelessWidget {
  const photo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homscrencontrol>(
      init: Homscrencontrol(),
      builder: (controller) => InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title:const Text('upload a photo'),
                  actions: [
                    MaterialButton(
                      onPressed: () {  controller.img();},
                      child:const Text("camera"),
                    ), MaterialButton(
                      onPressed: () { controller.galty();},
                      child:const Text("gallery"),
                    )
                  ],
                );
              });
         
        },
        child: 
            CircleAvatar(
              backgroundImage: controller.imge == null
                  ? const AssetImage('assets/images/profile_pic.png')
                  : FileImage(controller.imge),
              backgroundColor: Colors.white,
              // child: controller.imge == null
              //     ? Icon(Icons.person)
              //     : Image.file(controller.imge),
            
         
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class listile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final void Function()? onTapp;
  const listile({super.key, this.leading, this.title, this.onTapp});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapp,

      // color: Colors.white,
      child: ListTile(
        leading: leading,
        title: title,
      ),
    );
  }
}

void _showLogoutDialog(context) {
  Homscrencontrol homscrencontrol = Get.put(Homscrencontrol());
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Log Out'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // هنا يمكنك إضافة منطق الخروج (مثل مسح الجلسة أو تسجيل الخروج)
            FirebaseAuth.instance.signOut();
            sharedPref.clear();
            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.signOut();
            homscrencontrol.imge = null;
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully!')));
            Get.offAll(const Login());
          },
          child: const Text('Log Out'),
        ),
      ],
    ),
  );
}
