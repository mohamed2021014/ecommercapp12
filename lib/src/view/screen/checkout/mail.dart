import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecomerca/core/constant/apploti.dart';
import 'package:ecomerca/src/controller/mailcontroler.dart';
import 'package:ecomerca/src/view/widget/outh/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Mail extends StatelessWidget {
  final total;
  // ignore: prefer_const_constructors_in_immutables
  Mail({super.key, this.total});

  @override
  Widget build(BuildContext context) {
    Mailcontroler controller = Get.put(Mailcontroler());

    // ignore: unused_local_variable
    String? selectedValue;
//     final List<String> genderItems = [
//   'Male',
//   'Female',
// ];

    return Scaffold(
      body: Container(
        //   decoration: BoxDecoration( color: Colors.black),
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 25),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            SizedBox(
              height: 120,
              child: Lottie.asset(Apploti.mail),
            ),
            const Text(
              ' Send Request',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 70,
              child: CustonTextFormAuth(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "can't be Empty";
                  }
                  return null;
                },
                hinttext: "enter your name",
                iconData: Icons.person_outline_rounded,
                labeltext: "name",
                mycontroller: controller.name,
              ),
            ),
            SizedBox(
              height: 70,
              child: CustonTextFormAuth(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "can't be Empty";
                  }
                  final regex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (!regex.hasMatch(val)) {
                    return 'Invalid  email';
                  }
                  return null;
                },
                mycontroller: controller.email,
                hinttext: "Enter Your Email",
                iconData: Icons.email_outlined,
                labeltext: "Email",
              ),
            ),
            SizedBox(
              height: 70,
              child: CustonTextFormAuth(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "can't be Empty";
                  } else if (val.length < 11) {
                    return 'cant be phone <11';
                  } else if (val.length > 11) {
                   return 'cant be phone >11';
                  }
                  // final regex = RegExp(r'^\+?[1-9]\d{1,14}$');
                  // if (!regex.hasMatch(val)) {
                  //   return 'Invalid phone number';
                  // }
                  return null;
                },
                mycontroller: controller.phone,
                hinttext: "Enter Your phone",
                iconData: Icons.phone,
                labeltext: "phone",
              ),
            ),
            SizedBox(
              height: 44,
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // Add more decoration..
                ),
                hint: const Text(
                  'Conservation',
                  style: TextStyle(fontSize: 14),
                ),
                items: controller.genderItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please Conservation.';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when selected item is changed.
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                controller.Sendmail(context, total);
                // Map<String, String> nati = {
                //         'name': "$total",
                //           "description" :""  ,
                //           "image" : ""
                //       };
                //       nativacontrol
                //           .addItemToFavorite(nati); // إضافة إلى المفضلة
                // Get.snackbar('Success', 'Item added to favorites!',
                //     colorText: Colors.white);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(248, 29, 14, 1), // اللون الأول
                      // اللون الثاني
                      Color.fromARGB(255, 218, 25, 0), // اللون الثالث
                    ],
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'S e n d   ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            /*   CustomButtomAuth(
               
                onPressed: () {
                  controller.creataccount(context = context);

                  //controller.signup();
                }),*/
          ]),
        ),
      ),
    );
  }
}
