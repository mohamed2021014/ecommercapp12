import 'package:ecomerca/src/controller/checoutcontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checoutt1 extends StatelessWidget {
  const Checoutt1({super.key});

  @override
  Widget build(BuildContext context) {
    final Checoutcontroler controller = Get.put(Checoutcontroler());
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
          const  Text('checkout' ,
             style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),) ,
            // عرض RadioListTile للاختيارات
            Obx(() {
              return RadioListTile<String>(
                subtitle:
                    const Text(' will be delivered between 3-5 business days'),
                title: const Text("Standard DeliveryOrder " , style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),),
                value: "Standard DeliveryOrder",
                groupValue: controller.selectedOption.value,
                onChanged: (value) {
                  controller.selectedOption.value = value!;
                },
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Obx(() {
                return RadioListTile<String>(
                  subtitle: const Text(
                      'Place your order before 6pm and your items will be delivered the next day'),
                  title: const Text("Next Day Delivery" , style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                  value: "Next Day Delivery",
                  groupValue: controller.selectedOption.value,
                  onChanged: (value) {
                    controller.selectedOption.value = value!;
                  },
                );
              }),
            ),
            Obx(() {
              return RadioListTile<String>(
                subtitle: const Text(
                    'Pick a particular date from the calendar and order will be delivered on selected date'),
                title: const Text(
                  "Nominated Delivery",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                value: "Nominated Delivery",
                groupValue: controller.selectedOption.value,
                onChanged: (value) {
                  controller.selectedOption.value = value!;
                },
              );
            }),
            const SizedBox(height: 30),
            // زر التالي
            // Obx(() {
            //   return ElevatedButton(
            //     onPressed: controller.isOptionSelected
            //         ? () {
            //             // عند الضغط على زر "التالي"، يمكنك تنفيذ أي إجراء هنا
            //             Get.snackbar(
            //                 "تم اختيار", controller.selectedOption.value);

            //           }
            //         : null, // الزر يكون غير مفعل إذا لم يتم اختيار أي خيار
            //     child: Text("التالي"),
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(
            //         controller.isOptionSelected ? Colors.blue : Colors.grey,
            //       ),
            //     ),
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
