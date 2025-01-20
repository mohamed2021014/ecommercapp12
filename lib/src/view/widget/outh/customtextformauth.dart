import 'package:ecomerca/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustonTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final bool? obscureText;
  final void Function()? onTap; 
  final String? Function(String?)? validator ;
  const CustonTextFormAuth(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      this.mycontroller,
      this.obscureText,
      this.onTap, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField( 
        
        obscureText: obscureText == null || obscureText == false ? false : true,
        controller: mycontroller, 
        validator: validator,
        decoration: InputDecoration( 
          focusedBorder:const OutlineInputBorder(   borderRadius: BorderRadius.all(Radius.circular(30)),
             borderSide: BorderSide( color:AppColor.primrecolor)),
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
            suffixIcon: InkWell(
              onTap: onTap,
              child: Icon(iconData),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
