import 'package:ecomerca/core/constant/app_color.dart';
import 'package:ecomerca/src/controller/Nativacontrol.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Nativaction extends StatelessWidget {
  const Nativaction({super.key});

  @override
  Widget build(BuildContext context) {
    final Nativacontrol nativacontrol = Get.put((Nativacontrol()));

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
               
              Color.fromARGB(255, 16, 0, 247) , 
                  
               Color.fromARGB(255, 85, 151, 244)
              ], // الألوان المفضلة
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text('My order',
            style: GoogleFonts.aboreto(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: AppColor.darkGrey,
      ),
      body: Obx(() {
        return nativacontrol.nativation.isEmpty
            ? const Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.hourglass_empty,
                    size: 30,
                  ),
                  Text(' my order is Empty....')
                ],
              ))
            : ListView.builder(
                itemCount: nativacontrol.nativation.length,
                itemBuilder: (context, index) {
                  var item = nativacontrol.nativation[index];
                  return Container(
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        title: const Text(
                          'Your request has been sent successfully, you will be answered within 24 hours',
                          style: TextStyle(fontSize: 12),
                        ),
                        subtitle: Row(
                          children: [
                            const Text('Value of purchases : '),
                            Text(
                              "${item['name']!}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 232, 125, 3),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: IconButton(
                            icon: const Icon(Icons.highlight_remove,
                                color: Color.fromARGB(255, 227, 12, 12)),
                            onPressed: () {
                              nativacontrol.removeItemFromFavorite(
                                  index); // إزالة من المفضلة
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
